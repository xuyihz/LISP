;;;; ���� 2015-12-15 ���ڶ� ������ 
;;;;���ָ���
;;;;������ԭ�����ֻ���������һ������ 
(defun C:42( )
(WZFZYY "X") ;;;ˮƽ
)
(defun C:43( )
(WZFZYY "Y")	;;;��ֱ
)
 
(defun WZFZYY( direct / #k %k i gr n pt  first lst)
(SETVAR "CMDECHO" 0)
(setvar "osmode" 0)
(setq #k "1";��������
       %k T  ;ѭ������
       i nil ;��ʼ����
)
 

;;; ѡ�����������
(setq sel0 (ssget ":S" '((0 . "TEXT"))))
(setq first  (ssname sel0 0))
(setq lst (entget first))

(setq style1 (cdr (assoc 7 lst))) ;;; �õ�������ʽ
(setq layer1 (cdr (assoc 8 lst))) ;;; �õ�����ͼ��
(setq context1 (cdr (assoc 1 lst))) ;;; �õ���������
(setq angle1 (cdr (assoc 50 lst))) ;;; �õ���ת�Ƕ�
(setq duiqi1 (cdr (assoc 72 lst))) ;;; �õ����뷽ʽ
(setq duiqi2 (cdr (assoc 73 lst))) ;;; �õ����뷽ʽ
(setq height1 (cdr (assoc 40 lst))) ;;; �õ����ָ߶�
(setq ratio1 (cdr (assoc 41 lst))) ;;; �õ����ֱ���
(setq Colname (cdr (assoc 62 lst)))
(if  (and (= duiqi1 0 )(= duiqi2 0 )) (setq ptype 10) (setq ptype 11))
(setq ptype2 11)

(if  (or (= duiqi1 3 )(= duiqi1 5 )) 
(progn
(setq  lst (subst '(72 . 0) (assoc 72 lst) lst)) 

(setq  lst (subst '(11  0 0 0) (assoc 11 lst) lst))

(entmod lst) 
(setq ptype 10)
)
	
)





(setq old1 (cdr (assoc 10 lst))) ;;; �õ�����
(setq old2 (cdr (assoc 11 lst))) ;;; �õ�����
(setq old1x (car old1)) ;;; �õ�X����
(setq old1y (cadr old1)) ;;; �õ�y����
(setq old1z (caddr old1)) ;;; �õ�z����
(setq old2x (car old2)) ;;; �õ�X����
(setq old2y (cadr old2)) ;;; �õ�y����
(setq old2z (caddr old2)) ;;; �õ�z����

(setq Px (cadr (assoc ptype lst))) ;;; �õ�X����
(setq Py (caddr (assoc ptype lst))) ;;; �õ�y����


(command "clayer" layer1)
(command "textstyle" style1)
(cond ( (and (= duiqi1 0 )(= duiqi2 1 )) (setq duiqiStyle "BL") )
	( (and (= duiqi1 0 )(= duiqi2 2 )) (setq duiqiStyle "ML") )
	( (and (= duiqi1 0 )(= duiqi2 3 )) (setq duiqiStyle "TL") )
	( (and (= duiqi1 1 )(= duiqi2 1 )) (setq duiqiStyle "BC") )
	( (and (= duiqi1 1 )(= duiqi2 2 )) (setq duiqiStyle "MC") )
	( (and (= duiqi1 1 )(= duiqi2 3 )) (setq duiqiStyle "TC") )
	( (and (= duiqi1 2 )(= duiqi2 1 )) (setq duiqiStyle "BR") )
	( (and (= duiqi1 2 )(= duiqi2 2 )) (setq duiqiStyle "MR") )
	( (and (= duiqi1 2 )(= duiqi2 3 )) (setq duiqiStyle "TR") )
	( (and (= duiqi1 0 )(= duiqi2 0 )) (setq duiqiStyle "L") )
	( (and (= duiqi1 1 )(= duiqi2 0 )) (setq duiqiStyle "C") )
	( (and (= duiqi1 2 )(= duiqi2 0 )) (setq duiqiStyle "R") )
	( (and (= duiqi1 3 )(= duiqi2 0 )) (setq duiqiStyle "A") )
	( (and (= duiqi1 4 )(= duiqi2 0 )) (setq duiqiStyle "M") )
	( (and (= duiqi1 5 )(= duiqi2 0 )) (setq duiqiStyle "F") )
)


(setq aa(/  (* angle1 180) pi))

;;;(command "text" "J" duiqiStyle old1  height1 aa context1)
(if (/= Colname Nil)

(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") (cons 8 layer1) '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 height1) (cons 1  context1) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 old2x old2y old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)(cons 62 Colname)))


(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") (cons 8 layer1) '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 height1) (cons 1  context1) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 old2x old2y old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)))
)



(setq tag 0)  


(while %k  
(setq  gr (grread t 4 0);;ȡ��������������
n (car gr)       ;;������
pt (cadr gr)     ;;�������
)


(if (= n 5)

(if (= tag 0) ;;;******
(progn   ;;
(setq pt0 pt
tag 1
)

)
(progn
(setq deltax (- (car pt) (car pt0))) 
(setq deltay (- (cadr pt) (cadr pt0)))

(cond ((= "Y" direct) (progn (setq cos1 (- 0 (sin angle1)) ) (setq cos2 (cos angle1) ) ) )
     ((= "X" direct)(progn (setq cos1 (cos angle1) ) (setq cos2 (sin angle1) ) ))
)



(setq l1 (* deltax cos1))
(setq l2 (* deltay cos2))
(setq l (+ l1 l2)) 
(setq deltax2 (* l cos1)) ;;; �õ����ƫ��x����
(setq deltay2 (* l cos2)) ;;; �õ����ƫ��y����
(setq first  (ssname sel0 0))  
(setq lst (entget first)) 

(setq newP1 (list (+ Px deltax2) (+ Py deltay2)))



(setq new1 (cons ptype newP1))
(setq lst (subst new1 (assoc ptype lst) lst))

(entmod lst) 


) 
) 
)  


(if (= n 3) (setq %k nil) );;3��ʾ���;����ѭ��

(if (or (= n 2) (= n 25));;2��ʾ�ո�;25��ʾ�Ҽ�;����ѭ����ɾ������
(setq %k nil)
)


)




(setvar "osmode" 4271)
(SETVAR "CMDECHO" 1)
)

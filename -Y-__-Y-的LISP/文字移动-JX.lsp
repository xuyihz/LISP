;;;; ���� 2016-02-24 ������ ������ 
;;;;�����ƶ�
;;;; 2031WZYDYY YYΪ�̶���׺

(defun C:40( )
(WZYDYY "X")	
)
(defun C:41( )
(WZYDYY "Y")	
)
 
(defun WZYDYY (direct)
(SETVAR "CMDECHO" 0)
(setq os1 (getvar "osmode"))
(setvar "osmode" 0)
(setq #k "1";��������
       %k T  ;ѭ������
       i nil ;��ʼ����
)
 

;;; ѡ������ؼ��б�ע 
(setq sel0 (ssget ":S" '((0 . "TEXT"))))
(setq first  (ssname sel0 0))
(setq lst (entget first))

(setq style1 (cdr (assoc 7 lst))) ;;; �õ���������
(setq layer1 (cdr (assoc 8 lst))) ;;; �õ�����ͼ��
(setq context1 (cdr (assoc 1 lst))) ;;; �õ���������
(setq angle1 (cdr (assoc 50 lst))) ;;; �õ���ת�Ƕ�
(setq duiqi1 (cdr (assoc 72 lst))) ;;; �õ����뷽ʽ
(setq duiqi2 (cdr (assoc 73 lst))) ;;; �õ����뷽ʽ


(if  (and (= duiqi1 0 )(= duiqi2 0 )) (setq ptype 10) (setq ptype 11))
(if  (or (= duiqi1 3 )(= duiqi1 5 )) 
(progn
(setq  lst (subst '(72 . 0) (assoc 72 lst) lst)) 

(setq  lst (subst '(11  0 0 0) (assoc 11 lst) lst))

(entmod lst) 
(setq ptype 10)
)
)


(setq Px (cadr (assoc ptype lst))) ;;; �õ�X����
(setq Py (caddr (assoc ptype lst))) ;;; �õ�y����



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


(prompt "h390")


(setvar "osmode" os1)
(SETVAR "CMDECHO" 1)
)

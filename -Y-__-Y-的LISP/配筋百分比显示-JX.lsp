;;;; ���� 2016-12-27 ���ڶ� �������粻�� 
;;;;������ƽ������ʾ��ͬ�ٷֱ���������
(defun C:401(/ #k %k i gr n pt  first lst )

(SETVAR "CMDECHO" 0)
(setvar "osmode" 0)

;;; ѡ�����������
(setq sel (ssget  '((0 . "TEXT"))))
(if (/= sel Nil)
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii))
(setq lst (entget first))

(setq newtext (cdr (assoc 1 lst))) 
(setq NumRig (vl-string-search "x" newtext));;;�ҵ�x
(setq NumLef (vl-string-search " " newtext));;;�ҵ��ո�
(if (/= NumLef Nil)	
	(progn
	(setq NewContext1 (substr newtext (+ NumLef 2) 3 ));;;�õ�����
	(setq NewContext2 (substr newtext (+ NumRig 2 )) );;;�õ�����
)
)
(setq NumW (atoi NewContext1) )
(setq NumH (atoi NewContext2) )
(setq Num010 (* 0.0001 NumW (- NumH 40) ))
(setq Num015 (* 0.00015 NumW (- NumH 40) ))
(setq Num020 (* 0.00020 NumW (- NumH 40) ))
(setq Num025 (* 0.00025 NumW (- NumH 40)) )
(setq Out (strcat (rtos Num010 2 0)  " " (rtos Num015 2 0)  " "(rtos Num020 2 0)  " "(rtos Num025 2 0)))


(setq style1 (cdr (assoc 7 lst))) ;;; �õ�������ʽ
(setq layer1 (cdr (assoc 8 lst))) ;;; �õ�����ͼ��
(setq context0 (cdr (assoc 1 lst))) ;;; �õ���������
(setq angle1 (cdr (assoc 50 lst))) ;;; �õ���ת�Ƕ�
(setq duiqi1 (cdr (assoc 72 lst))) ;;; �õ����뷽ʽ
(setq duiqi2 (cdr (assoc 73 lst))) ;;; �õ����뷽ʽ
(setq height1 (cdr (assoc 40 lst))) ;;; �õ����ָ߶�
(setq ratio1 (cdr (assoc 41 lst))) ;;; �õ����ֱ���
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







(if (=  angle1 0)
(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(62 . 1)'(410 . "Model") (cons 8 "-Y-__-Y-�������ͼ��") '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 150) (cons 1  Out) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 old2x  (- old2y 200) old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)))
(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(62 . 1)'(410 . "Model") (cons 8 "-Y-__-Y-�������ͼ��") '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 150) (cons 1  Out) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 (+ old2x 200)  old2y  old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)))


)
(entmod lst)
(setq ii (+ ii 1))
)
)
)
(setvar "osmode" 4271)
(SETVAR "CMDECHO" 1)
)



;;;; @-Y-__-Y- 2015-11-10 ���ڶ� �������� 
;;;;��ͼ��ת��
;;;; YYLTCZH YYΪ�̶�ǰ׺��LTCZH����ͼ��ת��
;;;;��������Ҫ���ľ��ǵ�ѡ������ѡ���
;;;;��Ҫע�������������"TSSD_REIN"���ָ�ʽ


(defun c:323()
(SETVAR "CMDECHO" 0)

(initget (+ 1 4))
(setq Num (getint "\n��ͼ������ţ�") ) 
(cond ((= Num 0)  (Progn  (setq T1 300) (setq T2 "100")))
      ((= Num 1)  (Progn  (setq T1 150)(setq T2 "50")))
      ((= Num 2)  (Progn  (setq T1 75)(setq T2 "25")))
      ((= Num 3)  (Progn  (setq T1 60)(setq T2 "20")))
      ((= Num 7)  (Progn  (setq T1 300)(setq T2 "50-100")))
      ((= Num 8)  (Progn  (setq T1 300)(setq T2 "25-100")))
      ((= Num 9)  (Progn  (setq T1 150)(setq T2 "25-50")))
)

  

(setq P1 (getpoint "ѡȡ���Ͻǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���½ǵ㣡\n"))


;ò�ƽ�����ǽ��ͼ����������ֽ�
;(setvar "QAFLAGS" 1) 
;(setq sel (ssget "W" P1 P2 '((0 . "INSERT")) ) ) 
;(command "explode" sel "")
;(setvar "QAFLAGS" 0)


(princ "ѡ����Ҫת��ͼ��ʵ��\n")
(setq sel  (ssget "C" P1 P2))  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii)) 
(setq lst (entget first))
(setq laname (cdr (assoc 8 lst))) 
(setq ltype  (cdr (assoc 0 lst))) 






(cond
  (    (= ltype "DIMENSION") 
    (progn  
       
        (setq new1 (cons 8 "S-DETL-DIM"))  
      (setq lst (subst new1 (assoc 8 lst) lst))  
       (setq new1 (cons 3 T2))
      (setq lst (subst new1 (assoc 3 lst) lst))   
      (entmod lst)  
    )
  )
    ( (= ltype "TEXT")  
    (progn  
  
      (setq new1 (cons 8 "S-DETL-TEXT"))
      (setq lst (subst new1 (assoc 8 lst) lst))  
      (setq new1 (cons 40 T1))
      (setq lst (subst new1 (assoc 40 lst) lst))
      (setq new1 (cons 7 "TSSD_REIN"))
      (setq lst (subst new1 (assoc 7 lst) lst))
      (setq new1 (cons 41 0.75))
      (setq lst (subst new1 (assoc 41 lst) lst))
      (entmod lst)  
    )
  )
 
  (T     
	  (progn  
      (setq new1 (cons 8 "S-DETL-LINE1"))
      (setq lst (subst new1 (assoc 8 lst) lst))  
      (command "change" first "" "p" "c" 251  "" )   
      (entmod lst)  
    )
    )
)

(setq ii (+ ii 1))

)
)
) 

(setvar "CMDECHO" 1)
(princ "����������ȷ\n")


) 


;;;;;����Ϊ���Բ��� 
;;;(setq sel (ssget ))    
;;;(setq first  (ssname sel 0))  
;;;(setq lst (entget first))



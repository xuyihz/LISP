;;;; @-Y-__-Y- 2015-11-10 ���ڶ� �������� 
;;;;��ͼ��ת��
;;;; YYLTCZH YYΪ�̶�ǰ׺��LTCZH����ͼ��ת��
;;;;��������Ҫ���ľ��ǵ�ѡ������ѡ���
;;;;��Ҫע�������������"TSSD_REIN"���ָ�ʽ


(defun C:305()
(SETVAR "CMDECHO" 0)
(setq P1 (getpoint "ѡȡ���Ͻǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���½ǵ㣡\n"))


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
(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))


 (cond ((= laname "dsptext_beam") 
  
    (progn  
      (setq old (cdr (assoc 50 lst)))  
      (if  (or  (and (>= old t1) (<= old t2))  (and (>= old t3) (<= old t4))  )    (setq new (cons 8 "������_Y"))    (setq new (cons 8 "������_X"))  )
      (setq lst (subst new (assoc 8 lst) lst))  
      (entmod lst)  
    ))
    ((= laname "dsptext_col")
        (progn  
      (setq new (cons 8 "��������")) 
      (setq lst (subst new (assoc 8 lst) lst))  
      (command "change" first "" "p" "c" 2  "" )
      (entmod lst)  
    ))
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



;;;; @-Y-__-Y- 2015-12-24 ������ �������� 
;;;;�����Զ������
;;;;YY Ϊ�̶���׺��BCZX����������

(defun c:77(/ sel aa first lst P1X P1Y P2X P2Y P3X P3Y P4X P4Y P1 P2 P3 P4 PI NewP1 NewP2)
(SETVAR "CMDECHO" 0) 
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
 
;;;I-ѡ����Ҫ�޼����ߵ���
(prompt "ѡ��ֱ��1\n")
(setq sel (ssget  ":S" '((0 . "line")) ))
(if (/= sel Nil)
(setq aa (sslength  sel))
)
(while (or (/= aa 1) (= sel Nil))
 
(if (/= sel Nil) 
(progn
(prompt "����ѡ����࣬������ѡ��\n")
)
(prompt "δѡ�����ߣ�������ѡ��\n")
)
(setq sel (ssget   '((0 . "line")) )) 
(setq aa (sslength  sel))
)



(setq first  (ssname sel 0)) 
(setq lst (entget first))
(setq Laname (cdr (assoc 8 lst)))
(setq P1X (cadr (assoc 10 lst)))
(setq P1Y (caddr (assoc 10 lst)))
(setq P2X (cadr (assoc 11 lst)))
(setq P2Y (caddr (assoc 11 lst)))
(setq P1 (list P1X P1Y))
(setq P2 (list P2X P2Y))

(prompt "ֱ��1ѡ��ɹ�\n")




(prompt "ѡ��ֱ��2\n") 
(setq sel (ssget ":S" '((0 . "line")) ))
(if (/= sel Nil)
(setq aa (sslength  sel))
)
(while (or (/= aa 1) (= sel Nil))
(if (/= sel Nil) 
(progn
(prompt "����ѡ����࣬������ѡ��\n")
)
(prompt "δѡ�����ߣ�������ѡ��\n")
)
(setq sel (ssget   '((0 . "line")) )) 
(setq aa (sslength  sel))
)

(prompt "ֱ��2ѡ��ɹ�\n")
(setq second  (ssname sel 0)) 
(setq lst (entget second))
(setq P3X (cadr (assoc 10 lst)))
(setq P3Y (caddr (assoc 10 lst)))
(setq P4X (cadr (assoc 11 lst)))
(setq P4Y (caddr (assoc 11 lst)))
(setq P3 (list P3X P3Y))
(setq P4 (list P4X P4Y))



(setq PI (inters P1 P2 P3 P4 Nil))
(cond ((>= (distance P1 PI) (distance P2 PI)) (setq NewP1 P1))
    (T (setq NewP1 P2))
)
(cond ((>= (distance P3 PI) (distance P4 PI)) (setq NewP2 P3))
    (T (setq NewP2 P4))
)

(entdel first)
(entdel second)
(command "layer" "s" Laname "")
(command "line" NewP1 PI "")
(command "line" NewP2 PI "")

(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)


(defun c:779()
(prompt "ѡ��ֱ��1\n")
(setq sel (ssget  ":S" '((0 . "line")) ))
(if (/= sel Nil)
(setq aa (sslength  sel))
)
(while (or (/= aa 1) (= sel Nil))
 
(if (/= sel Nil) 
(progn
(prompt "����ѡ����࣬������ѡ��\n")
)
(prompt "δѡ�����ߣ�������ѡ��\n")
)
(setq sel (ssget   '((0 . "line")) )) 
(setq aa (sslength  sel))
)

(prompt "ֱ��1ѡ��ɹ�\n")
(setq first  (ssname sel 0)) 
(setq lst1 (entget first))


(prompt "ѡ��ֱ��2\n") 
(setq sel2 (ssget ":S" '((0 . "line")) ))
(if (/= sel2 Nil)
(setq aa2 (sslength  sel2))
)
(while (or (/= aa2 1) (= sel2 Nil))
(if (/= sel2 Nil) 
(progn
(prompt "����ѡ����࣬������ѡ��\n")
)
(prompt "δѡ�����ߣ�������ѡ��\n")
)
(setq sel2 (ssget   '((0 . "line")) )) 
(setq aa2 (sslength  sel2))
)
(prompt "ֱ��2ѡ��ɹ�\n")
(setq first2  (ssname sel2 0)) 
(setq lst2 (entget first2))
		
(command "FILLET" R 0 lst1 lst2)
)

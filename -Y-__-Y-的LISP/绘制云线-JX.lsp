;;;; @-Y-__-Y- 2015-11-10 ���ڶ� �������� 
;;;;�����Զ������
;;;;101HYXYY YYΪ�̶���׺��HZYX��������  1����У��  0 ������   1 ��1��  �ṹͼ�������ʵ�

(defun c:200HYXYY()                
(SETVAR "CMDECHO" 0) 
(HYXYY0)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)

(defun c:209HYXYY()                
(SETVAR "CMDECHO" 0) 
(HYXYY9)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)


(defun c:201HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "10") ;;;��ɫ
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)

(defun c:202HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "254") ;;;��ɫ
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)
(defun c:203HYXYY() ;;;�����ϵ�����                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "150")     ;;;��ɫ
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)

(defun c:204HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "2")     ;;;��ɫ
(HYXYY Num LType)
(princ "����������ȷ\n")
)

(defun c:205HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "7")     ;;;��ɫ
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)

(defun c:207HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "7")     ;;;��ɫ
(setq LType "240") ;;;��ɫ
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")
)

(defun HYXYY(Num1 LType1)
(setq chklay0  (getvar "clayer"))

(cond ((= LType1 "10") (setq Laname (strcat "-Y-__-Y-�Ľ���"  "ͼ��")))  ;;�ṹ�ϲ�ȷ����
      ((= LType1 "254") (setq Laname (strcat "-Y-__-Y-����"  "ͼ��")))  ;; �ṹ���޸ĵ�
      ((= LType1 "150") (setq Laname (strcat "-Y-__-Y-�Ľ���"  "ͼ��")))   ;;  ���ڽ����������ʵ�
      ((= LType1 "2") (setq Laname (strcat "-Y-__-Y-�������"  "ͼ��")))  ;;  ����������
      ((= LType1 "7") (setq Laname (strcat "-Y-__-Y-�Ľ�ע"  "ͼ��")))  ;;  
      ((= LType1 "240") (setq Laname (strcat "-Y-__-Y-�Ľ���"  "ͼ��")))  ;;��ͼ�������������
      (T ())
      )
      

(setq chklay (tblsearch "layer" Laname)) (if (= chklay nil) (command "layer" "m" Laname "c" LType1 "" "")(command "layer" "s" Laname "") )

(setq Textname "-Y-__-Y-�ĺ���")
(setq chktext (tblsearch "style" Textname)) (if (= chktext nil) (command "style" Textname "����" "" "1.0" "" "" "" )(command "textstyle" Textname) )


(command "color" "ByLayer")      

      
;;;;;; II-��ȡ���߳ߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ߵ�һ�ǵ㣡\n"))
(setq P2(getcorner P1 "ѡȡ���ߵڶ��ǵ㣡\n")) 
(command "rectangle" P1 P2) 



(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq DX (abs (- P1X P2X)) )
(setq DY (abs (- P1Y P2Y)) )
(setq Dmin (min DX DY))
(setq d (/ Dmin 5))
(command "revcloud" "S" "C" "A" d d "O" (entlast) "") 
(setq lst (entget (entlast)))
(setq old (cdr (assoc 43 lst)))  
(setq new (cons 43 10))
(setq lst (subst new (assoc 43 lst) lst))
(entmod lst)  

;;;III-����������
(setq dd (getvar "PLINEWID"))
(SETVAR "PLINEWID" 20)
(setq P3 (getpoint  "ѡȡ�����ߵ�һ�ǵ㣡\n"))
(setq P4 (getpoint P3 "ѡȡ�����ߵڶ��ǵ㣡\n"))
(command "pline" P3 P4 "")
(setq P5 (getpoint P4 "ѡȡ�����ߵ�һ�ǵ㣡\n"))
(command "pline" P4 P5 "")

(setq ss (getvar "osmode"))
(setvar "osmode" 0)


 ;;;IV-�����޶����

(if (= Num1 0) (princ "���������ע��\n")
(progn
(setq P3X (car P3))
(setq P3Y (cadr P3))
(setq P4X (car P4))
(setq P4Y (cadr P4)) 
(setq P5X (car P5))
(setq P5Y (cadr P5))
(setq DX (- P5X P4X))
(setq DY (- P4Y P3Y))
(setq PT1 (list (+ P4X 50)  (+ P4Y 150)  ));;;��һ���Ҷ˵�
(setq PT2 (list (+ P4X 50)  (- P4Y 150)  ));;;��һ���Ҷ˵�
(cond ((= LType1 "10") (setq MyText (strcat "����"  "---" )))  ;;�ṹ�ϲ�ȷ����
      ((= LType1 "254") (setq MyText (strcat "��" "---" )))  ;; �ṹ���޸ĵ�
      ((= LType1 "150") (setq MyText (strcat "����"  "---" )))   ;;  ���ڽ����������ʵ�
      ((= LType1 "2") (setq MyText (strcat "�����"  "---")))  ;;  �������
      ((= LType1 "7") (setq MyText (strcat "��ע"  "---")))  ;;  �ṹ�϶Խ���������
      ((= LType1 "240") (setq MyText (strcat "����"  "---")))  ;;  �ṹ�϶Խ���������
      (T ())
      )
(setq CTime (menucmd "M=$(edtime, $(getvar, date), YYYY\"��\"M\"��\"D\"��\")") )
  
(if  (> DX 0)
(progn
(command "text" "J" "BL" PT1  "500" "0" MyText  )
(command "text" "J" "TL" PT2  "500" "0" CTime  )
)

(progn
(command "text" "J" "BR" PT1  "500" "0" MyText )
(command "text" "J" "TR" PT2  "500" "0" CTime  )
)
)
(entmod lst)
)
)

(setvar "osmode" ss)
(SETVAR "PLINEWID" dd)
(command "clayer" chklay0)
)

(defun HYXYY0()

(setq Laname (strcat "-Y-__-Y-������ͼ��")) 
   
(setq chklay (tblsearch "layer" Laname)) (if (= chklay nil) (command "layer" "m" Laname "c" 30 "" "")(command "layer" "s" Laname "") )

(setq Textname "-Y-__-Y-�ĺ���")
(setq chktext (tblsearch "style" Textname)) (if (= chktext nil) (command "style" Textname "����" "" "1.0" "" "" "" )(command "textstyle" Textname) )


(command "color" "ByLayer")      
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
      
;;;;;; II-��ȡ���߳ߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ߵ�һ�ǵ㣡\n"))
(setq P2(getcorner P1 "ѡȡ���ߵڶ��ǵ㣡\n")) 
(command "rectangle" P1 P2) 
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq DX (abs (- P1X P2X)) )
(setq DY (abs (- P1Y P2Y)) )
(setq Dmin (min DX DY))
(setq d (/ Dmin 5))
(command "revcloud" "S" "C" "A" d d "O" (entlast) "") 
(setq lst (entget (entlast)))
(setq old (cdr (assoc 43 lst)))  
(setq new (cons 43 10))
(setq lst (subst new (assoc 43 lst) lst))
(entmod lst)  
(setvar "OSMODE" ss)

;;;III-����������
(setq dd (getvar "PLINEWID"))
(SETVAR "PLINEWID" 20)
(setq P3 (getpoint  "ѡȡ�����ߵ�һ�ǵ㣡\n"))
(setq P4 (getpoint P3 "ѡȡ�����ߵڶ��ǵ㣡\n"))
(command "pline" P3 P4 "")
(setq P5 (getpoint P4 "ѡȡ�����ߵ�һ�ǵ㣡\n"))
(command "pline" P4 P5 "")


 ;;;IV-�����޶����
(setq P3X (car P3))
(setq P3Y (cadr P3))
(setq P4X (car P4))
(setq P4Y (cadr P4)) 
(setq P5X (car P5))
(setq P5Y (cadr P5))
(setq DX (- P5X P4X))
(setq DY (- P4Y P3Y))
(setq PT1 (list (+ P4X 50)  (+ P4Y 50)  ));;;��һ���Ҷ˵�
(setq MyText "ע---")

 
  
(if  (> DX 0)

(command "text" "J" "BL" PT1  "500" "0" MyText)
 
(command "text" "J" "BR" PT1  "500" "0" MyText)
 
)

(SETVAR "PLINEWID" dd)


)


(defun HYXYY9()

(setq Laname (strcat "-Y-__-Y-������ͼ��")) 
   
(setq chklay (tblsearch "layer" Laname)) (if (= chklay nil) (command "layer" "m" Laname "c" 30 "" "")(command "layer" "s" Laname "") )

(setq Textname "-Y-__-Y-�ĺ���")
(setq chktext (tblsearch "style" Textname)) (if (= chktext nil) (command "style" Textname "����" "" "1.0" "" "" "" )(command "textstyle" Textname) )


(command "color" "ByLayer")      

      
;;;;;; II-��ȡ���߳ߴ���λ�� 
(setq dd (getvar "PLINEWID"))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(setq P1 (getpoint "ѡȡ���ߵ�һ�ǵ㣡\n"))
(setq P2(getcorner P1 "ѡȡ���ߵڶ��ǵ㣡\n")) 



(command "rectangle" P1 P2) 
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq DX (abs (- P1X P2X)) )
(setq DY (abs (- P1Y P2Y)) )
(setq Dmin (min DX DY))
(setq d (/ Dmin 5))
(command "revcloud" "S" "C" "A" d d "O" (entlast) "") 
(setq lst (entget (entlast)))
(setq old (cdr (assoc 43 lst)))  
(setq new (cons 43 10))
(setq lst (subst new (assoc 43 lst) lst))
(entmod lst)  

(setvar "OSMODE" ss)
(setvar "PLINEWID" dd)
)











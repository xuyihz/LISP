;;;; ���� 2015-12-18 ������ ������
;;;; ���� 2016-06-12 ����һ ������

(defun c:76( / P1 P2 LType ) ;;;;;������
(SETVAR "CMDECHO" 0)
(setq chklay  (getvar "clayer"))
(setq ss (getvar "osmode"))

;;;;;; I-��ȡ�����
;;;;;; II-����
(setq Laname (strcat "S-SLAB-TEXT")) 
(setq chklay2 (tblsearch "layer" Laname))
(if (= chklay2 nil) (command "layer" "m" Laname "c" 7 """") (command "layer" "s" Laname "")) 
(setq P1 (getpoint "ѡȡ��߻��㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq DX 250 )
(setq DY 250 )
(setq P2X (- P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P3X (+ P1X DX ) )
(setq P3Y (+ P1Y DY ) )
(setq P4X (+ P2X 1200 ) )
(setq P4Y P2Y)
(setq P2 (list P2X P2Y ))
(setq P3 (list P3X P3Y ))
(setq P4 (list P4X P4Y ))
(setq P5X P4X)
(setq P5Y (+ P4Y 50 ) )
(setq P5 (list P5X P5Y ))
(setvar "osmode" 0)
(setvar "plinewid" 0)
(command "pline" P4 P2 P1 P3 "")
(setq P6X (- P1X DX ) )
(setq P6Y  P1Y  )
(setq P7X (+ P1X DX ) )
(setq P7Y  P1Y )
(setq P6 (list P6X P6Y ))
(setq P7 (list P7X P7Y ))
 (command "line" P6 P7 "")
(command "textstyle" "TSSD_REIN")
(command "text" "J" "BR" P5  "300" "0" "���")


(command "clayer" chklay)
(setvar "osmode" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)




(defun C:99()  ;;;���ƶ���
(SETVAR "CMDECHO" 0)
(setq chklay  (getvar "clayer"))	
(setq P1 (getpoint "ѡȡ���ߵ�һ�㣡\n"))
(setq P2 (getpoint P1 "ѡȡ���ߵڶ��㣡\n"))
(setq Laname (strcat "S-BEAM-LINE2"))
(command "layer" "s" Laname "")
(command "mline" "J" "Z" P1 P2 "")
(command "explode" "L")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
)


(defun C:992()  ;;;���ƶ���
(SETVAR "CMDECHO" 0)

(setq P1 (getpoint "ѡȡ���ߵ�һ�㣡\n"))
(setq P2 (getpoint P1 "ѡȡ���ߵڶ��㣡\n"))
(command "mline" "J" "Z" P1 P2 "")
(command "explode" "L")

(setvar "CMDECHO" 1)
)


(defun c:88( / P1 P2 LType );;;���ƹ�ͨ��
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))

(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)
(defun c:882( / P1 P2 LType );;;���Ʊ��߼Ӵֹ�ͨ��
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))



(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)

(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:886( / P1 P2 LType );;;�����ĵ�Ϊ׼��������
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ�������ĵ㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(initget (+ 1 2 )) 
(setq DX (getint "\n�����") )
(setq DY (getint "\n����ߣ�") )
(setq P2X (- P1X (/ DX 2) ))
(setq P2Y (- P1Y (/ DY 2)) )
(setq P2 (list P2X P2Y ))
(setq P3X (+ P1X (/ DX 2) ))
(setq P3Y (+ P1Y (/ DY 2)) )
(setq P3 (list P3X P3Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:887( / P1 P2 LType );;;��������
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(initget (+ 1 2 )) 
(setq DX (getint "\n����ˮƽƫ�ƣ�") )
(setq DY (getint "\n��������ƫ�ƣ�") )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:884( / P1 P2 LType );;;���ƶ���
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "S" "S-WALL-BELINE" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "S" "S-WALL-BEHATCH" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)


(defun c:89( / P1 P2 LType );;;������̧��
(SETVAR "CMDECHO" 0) 
(setvar "plinewid" 20)
(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))


(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" P1 P2)
(command "layer" "m" "S-COLU-HATCH2" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "plinewid" 0)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:892( / P1 P2 LType );;;������̧��
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))


(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "m" "S-COLU-HATCH2" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:991( / P1 P2 LType );;;�����ĵ�Ϊ׼��������
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ�������ĵ㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(initget (+ 1 2 )) 
(setq DX 240 )
(setq DY 240 )
(setq P2X (- P1X (/ DX 2) ))
(setq P2Y (- P1Y (/ DY 2)) )
(setq P2 (list P2X P2Y ))
(setq P3X (+ P1X (/ DX 2) ))
(setq P3Y (+ P1Y (/ DY 2)) )
(setq P3 (list P3X P3Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH2" "c" "7" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

















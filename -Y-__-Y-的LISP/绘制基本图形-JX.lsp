;;;; ���� 2015-12-18 ������ ������
;;;; ���� 2016-06-12 ����һ ������





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
(defun c:882( / P1 P2 LType );;;���Ʊ��߹�ͨ��
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

(defun c:885( / P1 P2 LType );;;�����ĵ�Ϊ׼��������
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ�������ĵ㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
 
(setq DX 400)
(setq DY 400)
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


(defun c:87( / P1 P2 LType );;;���Ʋ���ͨ��
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))


(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:872( / P1 P2 LType );;;���Ʋ���ͨ��
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2 (getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))


(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)

(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:875( / P1 P2 LType );;;�����ĵ�Ϊ׼��������
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ�������ĵ㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq DX 400)
(setq DY 400)
(setq P2X (- P1X (/ DX 2) ))
(setq P2Y (- P1Y (/ DY 2)) )
(setq P2 (list P2X P2Y ))
(setq P3X (+ P1X (/ DX 2) ))
(setq P3Y (+ P1Y (/ DY 2)) )
(setq P3 (list P3X P3Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "50" ""  "L" "") 
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:876( / P1 P2 LType );;;�����ĵ�Ϊ׼��������
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
(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:877( / P1 P2 LType );;;��������
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
(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
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


(command "layer" "m" "S-COLU-LINE" "c" "6" "" "")
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


(command "layer" "m" "S-COLU-LINE" "c" "6" "" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "m" "S-COLU-HATCH2" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:83( );;;�����һ��ʵ�壨ǽ ����
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
(command "layer" "S" "S-WALL-BEHATCH" "")
(command "hatch" "solid" "L" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)
(defun c:832( );;;���ѡ��ʵ�壨ǽ ����
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "ѡȡ�ڲ��㣡\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "solid" "LA" "S-WALL-BEHATCH" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:85( );;;�����һ��ʵ�壨ǽ ����
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" "L" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)
(defun c:852( );;;���ѡ��ʵ�壨ǽ ����
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "ѡȡ�ڲ��㣡\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "solid" "LA" "S-COLU-HATCH" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:84( );;;�����һ���ǹ�ͨ��ǽ ����
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)
(defun c:842( );;;���ѡ�зǹ�ͨ��ǽ ����
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "ѡȡ�ڲ��㣡\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "DOTS" "1000" "" "LA" "S-COLU-HATCH" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:86( );;;�����һ����̧��ǽ ����
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
(command "layer" "m" "S-COLU-HATCH2" "c" "7" "" "")
(command "hatch" "solid" "L" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

(defun c:862( );;;���ѡ����̧��ǽ ����
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "ѡȡ�ڲ��㣡\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "solid" "LA" "S-COLU-HATCH2" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)


















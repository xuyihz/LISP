;;;; ���� 2015-11-10 ���ڶ� ������
;;;;���ƶ���
;;;; YYHZDJ YYΪ�̶�ǰ׺��HZDJ�����ƶ��������������ŵķ�ʽ
;;; ƽ���ʾ�����ƶ�������
;;; ���̣�ѡ�����ӣ������������ȡ����ԭʼ���꣬Ȼ�����֮���̶��ı�����λ��
;;; ��Ҫ�򿪲�׽
;;; ��������ʱֻ�ʺϵ������λ��� ���ʵ��任���������ڸ��߽״λ��������λ���


;;;ע��ѡ���ע��ʽΪ100


(defun c:546()
(SETVAR "CMDECHO" 0) 
(setq NumMax 34) ;;;��Ҫ��ǰ����ı��
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq P1 (getpoint "ѡȡ���ӵ�һ�ǵ㣡\n"))
(setq P2(getcorner P1 "ѡȡ���ӵڶ��ǵ㣡\n"))
;;;��������ͳһ�����ѡȡ���Ӹ��ǵ����깤��
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq PcX (/ (+ P1X P2X) 2))
(setq PcY (/ (+ P1Y P2Y) 2))

;;;;;; II-����������
(initget (+ 1 2 4)) 
(setq Num (getint "������ţ�") )

;;;ȷ���ߴ�
(if (< Num NumMax) 
(Progn
(cond ((= Num 1)  (Progn (setq LX 1300 ) (setq LY 1300)))
      ((= Num 2)  (Progn (setq LX 900 ) (setq LY 1300)))
      ((= Num 3)  (Progn (setq LX 1300 ) (setq LY 1300)))
      ((= Num 4)  (Progn (setq LX 1600 ) (setq LY 1050)))
      ((= Num 5)  (Progn (setq LX 1300 ) (setq LY 1700)))
      ((= Num 6)  (Progn (setq LX 1800 ) (setq LY 1600)))
      ((= Num 7)  (Progn (setq LX 1800 ) (setq LY 1600)))
      ((= Num 8)  (Progn (setq LX 1650 ) (setq LY 1650)))
      ((= Num 9)  (Progn (setq LX 1200 ) (setq LY 850)))
      ((= Num 10)  (Progn (setq LX 1150 ) (setq LY 1100)))
      ((= Num 11)  (Progn (setq LX 1050 ) (setq LY 1050)))
      ((= Num 12)  (Progn (setq LX 850 ) (setq LY 850)))
      ((= Num 13)  (Progn (setq LX 1550 ) (setq LY 1550)))
      ((= Num 14)  (Progn (setq LX 1600 ) (setq LY 1150)))
      ((= Num 15)  (Progn (setq LX 1250 ) (setq LY 1300)))
      ((= Num 16)  (Progn (setq LX 1300 ) (setq LY 1200)))
      ((= Num 17)  (Progn (setq LX 1000 ) (setq LY 1150)))
      ((= Num 18)  (Progn (setq LX 1300 ) (setq LY 1400)))
      ((= Num 19)  (Progn (setq LX 1100 ) (setq LY 1500)))
      ((= Num 20)  (Progn (setq LX 1350 ) (setq LY 1150)))
      ((= Num 21)  (Progn (setq LX 1100 ) (setq LY 1450)))
      ((= Num 22)  (Progn (setq LX 1850 ) (setq LY 1550)))
      ((= Num 23)  (Progn (setq LX 1800 ) (setq LY 1400)))
      ((= Num 24)  (Progn (setq LX 1600 ) (setq LY 1300)))
      ((= Num 25)  (Progn (setq LX 1350 ) (setq LY 1550)))
      ((= Num 26)  (Progn (setq LX 1350 ) (setq LY 1550)))
      ((= Num 27)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 28)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 29)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 30)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 31)  (Progn (setq LX 1400 ) (setq LY 1500)))
      ((= Num 32)  (Progn (setq LX 1050 ) (setq LY 1300)))
      ((= Num 33)  (Progn (setq LX 1050 ) (setq LY 850)))
)




;;;;;; III-���ƶ�������
(setq NewP1X (- PcX (/ LX 2) ) )
(setq NewP1Y (+ PcY (/ LY 2) ) )
(setq NewP2X (+ PcX (/ LX 2) ) )
(setq NewP2Y (- PcY (/ LY 2) ) )
(setq NewP1 (list NewP1X NewP1Y ))
(setq NewP2 (list NewP2X NewP2Y ))
(command "clayer" "S-FON-LINE1")
(command "rectangle" NewP1 NewP2)

;;;;;; IV-��ע
(command "clayer" "S-FON-DIM")
;;;����
(setq DXP1 (list NewP1X NewP2Y ))
(setq DXP2 (list P1X NewP2Y ))
(setq DXP3 (list P2X NewP2Y ))
(setq DXP4 NewP2)
(setq DXPend1 (list NewP1X (- NewP2Y 500) ))
(setq DXPend2 (list NewP1X (- NewP2Y 1000) ))
(command "dimlinear" DXP1  DXP2 DXPend1)
(command "dimcontinue" DXP3  DXP4 "" "")
(command "dimlinear" DXP1  DXP4 DXPend2)

;;;����
(setq DYP1 NewP1)
(setq DYP2 (list NewP1X P1Y ))
(setq DYP3 (list NewP1X P2Y ))
(setq DYP4 (list NewP1X NewP2Y ))
(setq DYPend1 (list (- NewP1X 500) NewP1Y ))
(setq DYPend2 (list (- NewP1X 1000) NewP1Y ))
(command "dimlinear" DYP1  DYP2 DYPend1)
(command "dimcontinue" DYP3  DYP4 "" "")
(command "dimlinear" DYP1  DYP4 DYPend2)

;;;;;; V-����������
(setq LP1 (list (+ PcX 200)  (- NewP1Y 200)));;;�߶��¶˵�
(setq LP2 (list (+ PcX 200)  (+ NewP1Y 1200)));;;�߶��϶˵�
(command "clayer" "S-FON-TEXT")
(command "line" LP1 LP2 "")

;;;;;; V-�������ָ�����
(setq LP3 (list (+ PcX 200)  (+ NewP1Y 950)));;;�߶���˵�
(setq LP4 (list (+ PcX 400)  (+ NewP1Y 950)));;;�߶��Ҷ˵�
(command "clayer" "-Y-__-Y-�ĸ���ͼ��")
(command "line" LP3 LP4 "")


(command "clayer" "S-COLU-TEXT")
(command "textstyle" "TSSD_REIN" "")
(setq LP5 (list (+ PcX 400)  (+ NewP1Y 950)));;;��һ���Ҷ˵�
(setq LP6 (list (+ PcX 400)  (+ NewP1Y 450)));;;�ڶ����Ҷ˵�

;;;ȷ������
(cond  ((= Num 1)  (Progn (setq T1 "DJ03 300" ) (setq T2 "B: X&Y:�L12@200")))
       ((= Num 2)  (Progn (setq T1 "DJ02 250" ) (setq T2 "B: X&Y:�L12@200")))
       ((= Num 3)  (Progn (setq T1 "DJ03") (setq T2 "")))
       ((= Num 4)  (Progn (setq T1 "DJ07 350" ) (setq T2 "B: X&Y:�L12@150")))
       ((= Num 5)  (Progn (setq T1 "DJ08 400" ) (setq T2 "B: X&Y:�L12@150")))
       ((= Num 6)  (Progn (setq T1 "DJ09 450" ) (setq T2 "B: X&Y:�L12@150")))
       ((= Num 7)  (Progn (setq T1 "DJ09" ) (setq T2 "")))
       ((= Num 8)  (Progn (setq T1 "DJ08" ) (setq T2 "")))
       ((= Num 9)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 10)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 11)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 12)  (Progn (setq T1 "DJ01 200" ) (setq T2 "B: X&Y:�L12@200")))
       ((= Num 13)  (Progn (setq T1 "DJ07" ) (setq T2 "")))
       ((= Num 14)  (Progn (setq T1 "DJ06" ) (setq T2 "")))
       ((= Num 15)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 16)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 17)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 18)  (Progn (setq T1 "DJ05" ) (setq T2 "B: X&Y:�L12@200")))
       ((= Num 19)  (Progn (setq T1 "DJ06" ) (setq T2 "B: X&Y:�L12@175")))
       ((= Num 20)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 21)  (Progn (setq T1 "DJ05" ) (setq T2 "")))
       ((= Num 22)  (Progn (setq T1 "DJ10 450" ) (setq T2 "B: X:�L12@130 Y:�L12@150")))
       ((= Num 23)  (Progn (setq T1 "DJ10" ) (setq T2 "")))
       ((= Num 24)  (Progn (setq T1 "DJ08" ) (setq T2 "")))
       ((= Num 25)  (Progn (setq T1 "DJ04 300" ) (setq T2 "B: X:�L12@175 Y:�L12@200"))) 
       ((= Num 26)  (Progn (setq T1 "DJ04" ) (setq T2 "")))
       ((= Num 27)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 28)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 29)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 30)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 31)  (Progn (setq T1 "DJ05" ) (setq T2 "")))
       ((= Num 32)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 33)  (Progn (setq T1 "DJ02" ) (setq T2 "")))       
)

(command "text" LP5  "300" "" T1)
(command "text" LP6  "300" "" T2)

)
)



(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

;;;;;;���Բ��ִ���
;;;(command "dimlinear" DXP1 DXP2   "400" "")
;;;(setq DXP1 '(0 0))
;;;(setq DXP2 '(1000 0 ))

;;;(command "text" "0,0"  "300" "" "B: X&Y:�L12@150")
;;;(command "text" "0,0"  "300" "" "")



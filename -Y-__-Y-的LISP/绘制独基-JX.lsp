;;;; ���� 2015-11-10 ���ڶ� ������
;;;;���ƶ���
;;;; YYHZDJ YYΪ�̶�ǰ׺��HZDJ�����ƶ��������������ŵķ�ʽ
;;; ƽ���ʾ�����ƶ�������
;;; ���̣�ѡ�����ӣ������������ȡ����ԭʼ���꣬Ȼ�����֮���̶��ı�����λ��
;;; ��Ҫ�򿪲�׽
;;; ��������ʱֻ�ʺϵ������λ��� ���ʵ��任���������ڸ��߽״λ��������λ���


;;;ע��ѡ���ע��ʽΪ100


(defun C:545()
(SETVAR "CMDECHO" 0) 
(setq NumMax 34) ;;;��Ҫ��ǰ����ı��
;;;;;; I-��ȡ���ӳߴ���λ�� 
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 1)
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
(cond
((= Num 1) (Progn (setq LX 1800) (setq LY 1800)(setq T1 "DJ01")))						
((= Num 2) (Progn (setq LX 1800) (setq LY 1800)(setq T1 "DJ01")))						
((= Num 3) (Progn (setq LX 2750) (setq LY 2750)(setq T1 "DJ03")))						
((= Num 4) (Progn (setq LX 2000) (setq LY 2000)(setq T1 "DJ01")))						
((= Num 5) (Progn (setq LX 2200) (setq LY 2200)(setq T1 "DJ01")))						
((= Num 6) (Progn (setq LX 3100) (setq LY 3100)(setq T1 "DJ04")))						
((= Num 7) (Progn (setq LX 2400) (setq LY 2400)(setq T1 "DJ02")))						
((= Num 8) (Progn (setq LX 3250) (setq LY 3250)(setq T1 "DJ05")))						
((= Num 9) (Progn (setq LX 2200) (setq LY 2200)(setq T1 "DJ01")))						
((= Num 10) (Progn (setq LX 3000) (setq LY 3000)(setq T1 "DJ04")))						
((= Num 11) (Progn (setq LX 2200) (setq LY 2200)(setq T1 "DJ01")))						
((= Num 12) (Progn (setq LX 2650) (setq LY 2650)(setq T1 "DJ04")))						
((= Num 13) (Progn (setq LX 1750) (setq LY 1750)(setq T1 "DJ02")))						
((= Num 14) (Progn (setq LX 2000) (setq LY 2000)(setq T1 "DJ03")))						
((= Num 15) (Progn (setq LX 1550) (setq LY 1550)(setq T1 "DJ01")))						
((= Num 16) (Progn (setq LX 1750) (setq LY 1750)(setq T1 "DJ01")))						
((= Num 17) (Progn (setq LX 1700) (setq LY 1700)(setq T1 "DJ01")))						
((= Num 18) (Progn (setq LX 1850) (setq LY 1850)(setq T1 "DJ01")))						
((= Num 19) (Progn (setq LX 1850) (setq LY 1850)(setq T1 "DJ01")))						
((= Num 20) (Progn (setq LX 1800) (setq LY 1800)(setq T1 "DJ01")))						
((= Num 21) (Progn (setq LX 1450) (setq LY 1450)(setq T1 "DJ02")))						
((= Num 22) (Progn (setq LX 1300) (setq LY 1300)(setq T1 "DJ02")))						
((= Num 23) (Progn (setq LX 1400) (setq LY 1400)(setq T1 "DJ01")))						
					
								
)


	  ;          ((= Num 1)  (Progn (setq LX 1800 ) (setq LY 1800)))
   ;   ((= Num 2)  (Progn (setq LX 2200 ) (setq LY 2200)))
	  ;((= Num 3)  (Progn (setq LX 2700 ) (setq LY 2700)))
   ;   ((= Num 4)  (Progn (setq LX 2900 ) (setq LY 2900)))
   ;   ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
   ;   ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
   ;   ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
   ;   ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
   ;   ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300))) 

;;; ��չ��
   ;   ((= Num 1)  (Progn (setq LX 2300 ) (setq LY 2300)))
   ;   ((= Num 2)  (Progn (setq LX 2600 ) (setq LY 2600)))
	  ;((= Num 3)  (Progn (setq LX 2900 ) (setq LY 2900)))
   ;   ((= Num 4)  (Progn (setq LX 3200 ) (setq LY 3200)))
   ;   ((= Num 5)  (Progn (setq LX 3700 ) (setq LY 3700)))
   ;   ((= Num 6)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 7)  (Progn (setq LX 4300 ) (setq LY 4300)))



;;; ��¥
   ;   ((= Num 1)  (Progn (setq LX 1700 ) (setq LY 1700)))
   ;   ((= Num 2)  (Progn (setq LX 3200 ) (setq LY 3200)))
	  ;((= Num 3)  (Progn (setq LX 3400 ) (setq LY 3400)))
   ;   ((= Num 4)  (Progn (setq LX 3800 ) (setq LY 3800)))
   ;   ((= Num 5)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 6)  (Progn (setq LX 4300 ) (setq LY 4300)))
   ;   ((= Num 7)  (Progn (setq LX 4700 ) (setq LY 4700)))
   ;   ((= Num 8)  (Progn (setq LX 4900 ) (setq LY 4900)))

;;; ����
   ;   ((= Num 1)  (Progn (setq LX 2000 ) (setq LY 2000)))
   ;   ((= Num 2)  (Progn (setq LX 2900 ) (setq LY 2900)))
	  ;((= Num 3)  (Progn (setq LX 3000 ) (setq LY 3000)))
   ;   ((= Num 4)  (Progn (setq LX 3500 ) (setq LY 3500)))
   ;   ((= Num 5)  (Progn (setq LX 3600 ) (setq LY 3600)))



   ;         ((= Num 1)  (Progn (setq LX 1800 ) (setq LY 1800)))
   ;   ((= Num 2)  (Progn (setq LX 2200 ) (setq LY 2200)))
	  ;((= Num 3)  (Progn (setq LX 2700 ) (setq LY 2700)))
   ;   ((= Num 4)  (Progn (setq LX 2900 ) (setq LY 2900)))
   ;   ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
   ;   ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
   ;   ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
   ;   ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
   ;   ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300)))




(setvar "OSMODE" 0)
;;;;;; III-���ƶ�������
(setq NewP1X (- PcX (/ LX 2) ) )
(setq NewP1Y (+ PcY (/ LY 2) ) )
(setq NewP2X (+ PcX (/ LX 2) ) )
(setq NewP2Y (- PcY (/ LY 2) ) )
(setq NewP1 (list NewP1X NewP1Y ))
(setq NewP2 (list NewP2X NewP2Y ))
(command "clayer" "S-FON-LINE1")
(command "rectangle" NewP1 NewP2)

;;;;;; V-����������
(setq LP1 (list (+ PcX 200)  (- NewP1Y 200)));;;�߶��¶˵�
(setq LP2 (list (+ PcX 200)  (+ NewP1Y 500)));;;�߶��϶˵�
(command "clayer" "S-FON-TEXT")
(command "line" LP1 LP2 "")



(command "clayer" "S-FON-TEXT")
(command "textstyle" "TSSD_REIN" "")
(setq LP5 (list (+ PcX 250)  (+ NewP1Y 240)));;;��һ���Ҷ˵�
(setq LP6 (list (+ PcX 250)  (+ NewP1Y 450)));;;�ڶ����Ҷ˵�

;;;ȷ������


(command "text" LP5  "300" "0" T1)


)
)


(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "����������ȷ\n")
)

;;;;;;���Բ��ִ���
;;;(command "dimlinear" DXP1 DXP2   "400" "")
;;;(setq DXP1 '(0 0))
;;;(setq DXP2 '(1000 0 ))

;;;(command "text" "0,0"  "300" "" "B: X&Y:�L12@150")
;;;(command "text" "0,0"  "300" "" "")



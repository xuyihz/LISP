;;;; ���� 2016-06-07 ���ڶ� ������ 
;;;;��ʾ����
  
(defun C:1110 ( / LH HT)
(setq LH "���110" )
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1120 ( / LH HT)
(setq LH "���120")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1130 ( / LH HT)
(setq LH "���130")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1140 ( / LH HT)
(setq LH "���140")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1150 ( / LH HT)
(setq LH "���150")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1160 ( / LH HT)
(setq LH "���160")
(setq HT "300" )
(BZBH  LH HT)

)
(defun C:2150 ( / LH HT)
(setq LH "150����")
(setq HT "150")
(BZBH  LH HT)
)


;;;ѡ���������ٿ���  
(defun BZBH (l H / #k %k i gr n pt  first lst)
(SETVAR "CMDECHO" 0)


(setq chklay  (getvar "clayer"))
(command "clayer" "S-SLAB-TEXT")

;;;ѡ��Ҫ��ע��ȵİ�
(setq P1 (getpoint "ѡȡ���һ�ǵ㣡\n"))
(setq P2(getcorner P1 "ѡȡ��ڶ��ǵ㣡\n")) 
(command "line" P1 P2 "")

(setq ss (getvar "osmode"))
(setvar "osmode" 0)
(setq Px1 (car P1))
(setq Py1 (cadr P1))
(setq Px2 (car P2))
(setq Py2 (cadr P2))

(setq dx (- Px2 Px1))
(setq dy (- Py2 Py1))
(setq x2 (* dx dx))
(setq y2 (* dy dy))


(if (> dx 0)
    (progn (setq PxL Px1) (setq PxR Px2)(setq PyL Py1) (setq PyR Py2) (setq dxLR dx)(setq dyLR dy))
    (progn (setq PxL Px2) (setq PxR Px1)(setq PyL Py2) (setq PyR Py1) (setq dxLR (* -1 dx))(setq dyLR (* -1 dy)))
)

(setq angle0  (angtos (atan dyLR dxLR) 0 0))
(setq angle0 (atof angle0))
(cond 
   ((and (>= angle0 270) (< angle0 315)) (setq  Num 1) )
   ((and (>= angle0 315) (<= angle0 360))  (setq  Num 1))
   ((and (>= angle0 0) (< angle0 45))  (setq  Num 1))
   ((and (>= angle0 45)  (<= angle0 90)) (setq  Num 2))
)

(if (= Num 1) 
   (progn (setq PLx (/(+ px1 Px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (atan dyLR dxLR)) )
   (progn (setq PLx (/(+ px1 Px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (+ PI (atan dyLR dxLR))) )
 )
(setq PL (list PLx PLy))
(setq AL (+ arc1 (/ PI 2)) )
(setq angle1 (*(/ arc1 PI) 180))


(setq PL1x (+ PLx (* 50 (cos AL))))
(setq PL1y (+ PLy (* 50 (sin AL))))
(setq PL1 (list PL1x PL1y))
(command "text" "J" "BC" PL1  H angle1 l)



(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)

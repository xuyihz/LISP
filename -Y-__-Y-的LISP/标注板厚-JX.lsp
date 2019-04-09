;;;; 姜雄 2016-06-07 星期二 天气晴 
;;;;显示梁长
  
(defun C:1110 ( / LH HT)
(setq LH "板厚110" )
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1120 ( / LH HT)
(setq LH "板厚120")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1130 ( / LH HT)
(setq LH "板厚130")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1140 ( / LH HT)
(setq LH "板厚140")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1150 ( / LH HT)
(setq LH "板厚150")
(setq HT "300" )
(BZBH  LH HT)
)
(defun C:1160 ( / LH HT)
(setq LH "板厚160")
(setq HT "300" )
(BZBH  LH HT)

)
(defun C:2150 ( / LH HT)
(setq LH "150文字")
(setq HT "150")
(BZBH  LH HT)
)


;;;选中条件不再苛刻  
(defun BZBH (l H / #k %k i gr n pt  first lst)
(SETVAR "CMDECHO" 0)


(setq chklay  (getvar "clayer"))
(command "clayer" "S-SLAB-TEXT")

;;;选择要标注厚度的板
(setq P1 (getpoint "选取板第一角点！\n"))
(setq P2(getcorner P1 "选取板第二角点！\n")) 
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

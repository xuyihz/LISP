;;;; 姜雄 2017-01-02 星期一 天气晴 

  
(defun C:651( )
(HZFJGJ)
)


;;;选中条件不再苛刻  
(defun HZFJGJ()
(SETVAR "CMDECHO" 0)


(setq chklay  (getvar "clayer"))
(command "clayer" "S-SLAB-RBAR")

;;;选择要标注厚度的板
(setq P1 (getpoint "选取第一点！\n"))
(setq P2 (getpoint P1 "选取第二点！\n")) 
(setvar "plinewid" 0)



(setq Px1 (car P1))
(setq Py1 (cadr P1))
(setq Px2 (car P2))
(setq Py2 (cadr P2))



(setq dx (- Px2 Px1))
(setq dy (- Py2 Py1))


(setq x2 (* dx dx))
(setq y2 (* dy dy))

(setq dd (sqrt (+ x2 y2 ) ))


(if (> dx 0)
    (progn (setq PxL Px1) (setq PxR Px2)(setq PyL Py1) (setq PyR Py2) (setq dxLR dx)(setq dyLR dy))
    (progn (setq PxL Px2) (setq PxR Px1)(setq PyL Py2) (setq PyR Py1) (setq dxLR (* -1 dx))(setq dyLR (* -1 dy)))
)

(setq angle0  (angtos (atan dyLR dxLR) 0 0))
(setq angle0 (atof angle0))
(cond 
   ((and (>= angle0 270) (< angle0 315)) (setq  Num 2) )
   ((and (>= angle0 315) (<= angle0 360))  (setq  Num 1))
   ((and (>= angle0 0) (< angle0 45))  (setq  Num 1))
   ((and (>= angle0 45)  (<= angle0 90)) (setq  Num 1))
)



(if (= Num 1) 
   (progn (setq PLx (/(+ px1 px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (atan dyLR dxLR)) )
   (progn (setq PLx (/(+ px1 px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (+ PI (atan dyLR dxLR))) )
 )
(setq PL (list PLx PLy))
(setq AL (+ arc1 (/ PI 2)) )
(setq angle1 (*(/ arc1 PI) 180))


(setq t1 45)
(setq t2 135)
(setq t3 225)
(setq t4 315)
(setq t0 90)
(if  (or  (and (>= angle1 t1) (<= angle1 t2))  (and (>= angle1 t3) (<= angle1 t4)))
	(command "clayer" "S-BEAM-XRBAR")
	(command "clayer" "S-BEAM-YRBAR")
)



(setq Px11 (+ Px1  (* -210 (cos AL))))
(setq Py11 (+ Py1 (* -210 (sin AL))))
(setq P11 (list Px11 Py11))
(setq Px12 (+ Px2  (* -210 (cos AL))))
(setq Py12 (+ Py2 (* -210 (sin AL))))
(setq P12 (list Px12 Py12))



(setq Px21 (+ Px1  (* -140 (cos AL))))
(setq Py21 (+ Py1 (* -140 (sin AL))))
(setq P21 (list Px21 Py21))
(setq Px22 (+ Px2  (* -140 (cos AL))))
(setq Py22 (+ Py2 (* -140 (sin AL))))
(setq P22 (list Px22 Py22))

(setq Px31 (+ Px1  (* -70 (cos AL))))
(setq Py31 (+ Py1 (* -70 (sin AL))))
(setq P31 (list Px31 Py31))

(setq Px32 (+ Px2  (* -70 (cos AL))))
(setq Py32 (+ Py2  (* -70 (sin AL))))
(setq P32 (list Px32 Py32))

(setq Px41 (+ Px1  (* 270 (cos AL))))
(setq Py41 (+ Py1 (* 270 (sin AL))))
(setq P41 (list Px41 Py41))
(setq Px42 (+ Px2  (* 270 (cos AL))))
(setq Py42 (+ Py2 (* 270 (sin AL))))
(setq P42 (list Px42 Py42))

(setq Px51 (+ Px1  (* 340 (cos AL))))
(setq Py51 (+ Py1 (* 340 (sin AL))))
(setq P51 (list Px51 Py51))
(setq Px52 (+ Px2  (* 340 (cos AL))))
(setq Py52 (+ Py2 (* 340 (sin AL))))
(setq P52 (list Px52 Py52))

(setq Px61 (+ Px1  (* 410 (cos AL))))
(setq Py61 (+ Py1 (* 410 (sin AL))))
(setq P61 (list Px61 Py61))
(setq Px62 (+ Px2  (* 410 (cos AL))))
(setq Py62 (+ Py2 (* 410 (sin AL))))
(setq P62 (list Px62 Py62))
(setq ss (getvar "osmode"))
(setvar "osmode" 0)


(command "pline" P11 P12 "")
(command "pline" P21 P22 "")
(command "pline" P31 P32 "")
(command "pline" P41 P42 "")
(command "pline" P51 P52 "")
(command "pline" P61 P62 "")

(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)




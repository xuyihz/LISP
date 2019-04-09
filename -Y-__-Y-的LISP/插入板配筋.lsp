;;;; 姜雄 2017-01-02 星期一 天气晴 

  
(defun C:611( )

(setq type "B" );;;B代表同时标注序号和配筋
(BZBPJ  type 2)
)
(defun C:613( )

(setq type "C" )
(BZBPJ   type 2)
)

(defun C:615( )
(setq type "C" )
(BZBPJ   type 1) ;;;1代表单边
)

(defun C:617( )
(setq type "B" )
(BZBPJ   type 1)
)

(defun C:619( )

(setq type "A" );;;B代表同时标注序号和配筋
(BZBPJ  type 2)
)

(defun C:6113( )

(setq type "B" );;;B代表同时标注序号和配筋
(BZBPJ  type 2)
)
(defun C:6133( )

(setq type "C" )
(BZBPJ   type 2)
)

(defun C:6153( )
(setq type "C" )
(BZBPJ   type 1) ;;;1代表单边
)

(defun C:6173( )
(setq type "B" )
(BZBPJ   type 1)
)

(defun C:6193( )

(setq type "A" );;;B代表同时标注序号和配筋
(BZBPJ  type 2)
)


(defun C:631( )
(BZBPJ2 "板底")
)

(defun C:633( )
(BZBPJ2 "板顶")
)

;;;选中条件不再苛刻  
(defun BZBPJ(Ltype side)
(SETVAR "CMDECHO" 0)



(setq chklay  (getvar "clayer"))
(command "clayer" "S-SLAB-RBAR")

;;;选择要标注厚度的板
(setq ss (getvar "osmode"))

(setq P1 (getpoint "选取第一点！\n"))
(setq P2 (getpoint P1 "选取第二点！\n")) 
(setvar "plinewid" 0)



(setq Px1 (car P1))
(setq Py1 (cadr P1))
(setq Px2 (car P2))
(setq Py2 (cadr P2))



(setq dx (- Px2 Px1))
(setq dy (- Py2 Py1))

(setq Px3 (- Px1 dx))
(setq Py3 (- Py1 dy))
(setq P3 (list Px3 Py3))



(setq x2 (* dx dx))
(setq y2 (* dy dy))

(setq dd (sqrt (+ x2 y2 ) ))
(setq dd (- dd 100 ));;;;委曲求全的代码
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

(if (= side 2)
(progn (setq Px5 (+ Px3  (* -150 (cos AL))))
(setq Py5 (+ Py3 (* -150 (sin AL))))
(setq P5 (list Px5 Py5))
)
(progn (setq Px5 (+ Px1  (* -150 (cos AL))))
(setq Py5 (+ Py1 (* -150 (sin AL))))
(setq P5 (list Px5 Py5))
)
)

(setq Px6 (+ Px2  (* -150 (cos AL))))
(setq Py6 (+ Py2 (* -150 (sin AL))))
(setq P6 (list Px6 Py6))


(setvar "osmode" 0)
(if (= side 2)
(command "pline" P5 P3 P1 P2 P6 "")
(command "pline" P5 P1 P2 P6 "")
)

(command "clayer" "S-SLAB-RTEXT")

(setq PL1x (+ PLx (* -100 (cos AL))))
(setq PL1y (+ PLy (* -100 (sin AL))))
(setq PL1 (list PL1x PL1y))

(setq PL2x (+ PLx (* 250 (cos AL))))
(setq PL2y (+ PLy (* 250 (sin AL))))
(setq PL2 (list PL2x PL2y))

(setq PL3x (+ Px1 (* 125 (sin AL))))
(setq PL3y (+ Py1 (* -125 (cos AL))))
(setq PL3x (+ PL3x (* 50 (cos AL))))
(setq PL3y (+ PL3y (* 50 (sin AL))))
(setq PL3 (list PL3x PL3y))

(setq PL4x (+ PL2x (* 250 (sin AL))))
(setq PL4y (+ PL2y (* -250 (cos AL))))
(setq PL4 (list PL4x PL4y))

(command "text" "J" "TC" PL1 300 angle1 (rtos dd 2 0))


(if (= Ltype "B")
	(progn (if (= side 2) (command "text" "J" "BL" PL3 300 angle1 "%%1328@200")
	 (command "text" "J" "ML" PL4 300 angle1 "%%1328@200")
	 )
     )
)

(if (= Ltype "A")
	 (command "text" "J" "BL" PL3 300 angle1 "板顶附加：%%1328@200")
)

(if (/= Ltype "A")
	
(progn
(command "text" "J" "MC" PL2 300 angle1 1)
(command "circle" PL2 175)
))



(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)



;;;选中条件不再苛刻  
(defun BZBPJ2(pos)
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


(setq PL1x (+ PLx (* 50 (cos AL))))
(setq PL1y (+ PLy (* 50 (sin AL))))
(setq PL1 (list PL1x PL1y))

(setq Px3 (+ Px1  (* -150 (cos AL))))
(setq Py3 (+ Py1 (* -150 (sin AL))))
(setq P3 (list Px3 Py3))
(setq Px4 (+ Px2  (* -150 (cos AL))))
(setq Py4 (+ Py2 (* -150 (sin AL))))
(setq P4 (list Px4 Py4))

(setq ss (getvar "osmode"))
(setvar "osmode" 0)


(if (= pos "板顶")
(command "pline" P3 P1 P2 P4 "")
(command "pline" P1 P2 "")
)

(command "clayer" "S-SLAB-RTEXT")

(if (= pos "板顶")
(command "text" "J" "BC" PL1 300 angle1 "板顶：%%13210@200")
(command "text" "J" "BC" PL1 300 angle1 "板底：%%13210@200")
)

(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)

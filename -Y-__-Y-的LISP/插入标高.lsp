(defun c:76() ;;;;;插入标高
	(CRBG 1 "S-SLAB-TEXT")
)
(defun c:763() ;;;;;插入标高
	(CRBG 0.2 "S-DETL-TEXT")
)
(defun CRBG(ra Laname) ;;;;;插入标高
(SETVAR "CMDECHO" 0)
(setq chklay  (getvar "clayer"))
(setq ss (getvar "osmode"))

;;;;;; I-获取插入点
;;;;;; II-插入

(setq chklay2 (tblsearch "layer" Laname))
(if (= chklay2 nil) (command "layer" "m" Laname "c" 7 """") (command "layer" "s" Laname "")) 
(setq P1 (getpoint "选取标高基点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq DX (* ra 250 ) )
(setq DY (* ra 250 ))
(setq P2X (- P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P3X (+ P1X DX ) )
(setq P3Y (+ P1Y DY ) )
(setq P4X (+ P2X (* ra 1200 ) ) )
(setq P4Y P2Y)
(setq P2 (list P2X P2Y ))
(setq P3 (list P3X P3Y ))
(setq P4 (list P4X P4Y ))
(setq P5X P4X)
(setq P5Y (+ P4Y (* ra 50 ) ) )
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
(command "text" "J" "BR" P5  (* ra 300 ) "0" "标高")


(command "clayer" chklay)
(setvar "osmode" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)




;;;选中条件不再苛刻  
(defun c:761()
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
   ((and (>= angle0 270) (< angle0 315)) (setq  Num 2) )
   ((and (>= angle0 315) (<= angle0 360))  (setq  Num 1))
   ((and (>= angle0 0) (< angle0 45))  (setq  Num 1))
   ((and (>= angle0 45)  (<= angle0 90)) (setq  Num 1))
)

(if (= Num 1) 
   (progn (setq PLx (/(+ px1 Px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (atan dyLR dxLR)) )
   (progn (setq PLx (/(+ px1 Px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (+ PI (atan dyLR dxLR))) )
 )
(setq PL (list PLx PLy))
(setq AL (+ arc1 (/ PI 2)) )
(setq angle1 (*(/ arc1 PI) 180))


(setq t1 (/ PI 4))
(setq t2 (* 3 t1))
(setq t3 225)
(setq t4 315)
(setq t0 90)

(setq P1X PLx)
(setq P1Y PLy)
(setq P1 (list P1x P1y))

(setq DX 250 )
(setq DY 250 )
(setq D  (* 250 (sqrt 2)) )

(setq P2X (+ (* D  (cos (+ arc1 t2))) P1X ) )
(setq P2Y (+ (* D  (sin (+ arc1 t2))) P1Y ) )
(setq P3X (+ (* D  (cos (+ arc1 t1))) P1X ) )
(setq P3Y (+ (* D  (sin (+ arc1 t1))) P1Y ) )
(setq P4X (+ P2X (* 1200 (cos arc1)) ) )
(setq P4Y (+ P2Y (* 1200 (sin arc1)) ) )
(setq P2 (list P2X P2Y ))
(setq P3 (list P3X P3Y ))
(setq P4 (list P4X P4Y ))
(setq P5X P4X)
(setq P5Y (+ P4Y (* 50 (sin AL)) ) )
(setq P5X (+ P4X (* 50 (cos AL)) ) )
(setq P5 (list P5X P5Y ))
(setvar "osmode" 0)
(setvar "plinewid" 0)
(command "pline" P4 P2 P1 P3 "")
(command "textstyle" "TSSD_REIN")
(command "text" "J" "BR" P5  "300" angle1 "标高")





(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)

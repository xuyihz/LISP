;;;; 姜雄 2016-06-07 星期二 天气晴 
;;;;显示梁长
;;;选中条件不再苛刻  
(defun C:44 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "BL" "B" 211)	
)


(defun C:442 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "BL" "C" 211)	
)

(defun C:45 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "BC" "B" 211)		
)

(defun C:46 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "BR" "B" 211)
)


(defun C:47 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "TL" "B" 211)
)

(defun C:462 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "BR" "C" 211)
)

(defun C:48 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "TC" "B" 211)		
)

(defun C:49 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "TR" "B" 211)		
)

(defun C:482 ( / #k %k i gr n pt  first lst)
(CRYWBZ "原位配筋" "TC" "C" 211)		
)

(defun C:74 ( / #k %k i gr n pt  first lst)
(CRYWBZ "(-0.050)" "TC" "B" 2)		
)
(defun C:741 ( / #k %k i gr n pt  first lst)
(CRYWBZ "(-0.050)" "TC" "C" 2)		
)

(defun C:300 ( / LH)
(setq LH "x300")
(CRYWBZ  LH  "TC"  "B" 7)
)
(defun C:350 ( / LH)
(setq LH "x350")
(CRYWBZ LH  "TC" "B" 7)
)
(defun C:400 ( / LH)
(setq LH "x400")
(CRYWBZ  LH "TC"  "B" 7)
)
(defun C:450 ( / LH)
(setq LH "x450")
(CRYWBZ  LH "TC"  "B" 7)
)
(defun C:500 ( / LH)
(setq LH "x500")
(CRYWBZ  LH  "TC" "B" 7)
)
(defun C:550 ( / LH)
(setq LH "x550")
(CRYWBZ LH  "TC" "B" 7)
)
(defun C:600 ( / LH)
(setq LH "x600")
(CRYWBZ LH  "TC" "B" 7)
)
(defun C:650 ( / LH)
(setq LH "x650")
(CRYWBZ  LH  "TC" "B" 7)
)
(defun C:700 ( / LH)
(setq LH "x700")
(CRYWBZ  LH  "TC" "B" 7)
)
(defun C:750 ( / LH)
(setq LH "x750")
(CRYWBZ  LH  "TC" "B" 7)
)
(defun C:800 ( / LH)
(setq LH "x800")
(CRYWBZ  LH  "TC" "B" 7)
)

(defun C:900 ( / LH)
(setq LH "x900")
(CRYWBZ  LH  "TC" "B" 7)
)

(defun C:3001 ( / LH)
(setq LH "x300")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:3501 ( / LH)
(setq LH "x350")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:4001 ( / LH)
(setq LH "x400")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:4501 ( / LH)
(setq LH "x450")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:5001 ( / LH)
(setq LH "x500")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:5501 ( / LH)
(setq LH "x550")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:6001 ( / LH)
(setq LH "x600")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:6501 ( / LH)
(setq LH "x650")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:7001 ( / LH)
(setq LH "x700")
(CRYWBZ  LH  "TC" "C" 7)
)
(defun C:7501 ( / LH)
(setq LH "x750")
(CRYWBZ LH  "TC" "C" 7)
)
(defun C:8001 ( / LH)
(setq LH "x800")
(CRYWBZ LH  "TC" "C" 7)
)

(defun C:9001 ( / LH)
(setq LH "x900")
(BZLG  LH  "TC" "C" 7)
)


(defun c:341() ;;;插入集中标注
	(CRJZBZ 400 "B")   
)
(defun c:342() ;;;插入集中标注有构造钢筋
	(CRJZBZ 600 "B")   
)



(defun c:344() ;;;插入集中标注有构造钢筋
	(CRJZBZ 600 "C")   
)




(defun CRJZBZ(BH Ltype) ;;;插入集中标注              
(SETVAR "CMDECHO" 0)

(setq chklay  (getvar "clayer"))
(setq t1 45)
(setq t2 135)
(setq t3 225)
(setq t4 315)
(setq t0 90)

(setq ss (getvar "osmode"))
(setvar "osmode" 0)
(command "textstyle" "TSSD_REIN")
;;;选择所要移动引线
;;;根据文字对齐判断引线方向
(prompt "选择梁线\n")
(setq sel (ssget  '((-4 . "<or")(0 . "ARC")(0 . "LINE") (-4 . "or>")(-4 . "<or")(8 . "S-BEAM-LINE1") (8 . "S-BEAM-LINE2") (-4 . "or>")) ))
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii))  
(setq lst (entget first))
(setq type  (cdr (assoc 0 lst))) 
(if (= type "ARC")
	(progn
	(setq Pcex (cadr (assoc 10 lst)))
	(setq Pcey (caddr (assoc 10 lst)))
	(setq A1 (cdr (assoc 50 lst)))
	(setq A2 (cdr (assoc 51 lst)))
	(setq R (cdr (assoc 40 lst)))

    (if (> A1 A2)
				(progn 
					(if (< (- A1 A2) PI)
					(setq AC (/ (+ A1 A2) 2))
					(setq AC (/ (+ (- A1 (* PI 2)) A2) 2))
				    )
				)
			    (progn 
					(if (< (- A2 A1) PI)
					(setq AC (/ (+ A1 A2) 2))
					(setq AC (/ (+ (- A2 (* PI 2)) A1) 2))
			        )
			    )	
	)
	;;得到两端点和中点坐标
	(setq dxA1 (* R (cos A1)))
	(setq dxA2 (* R (cos A2)))
	(setq dxAC (* R (cos AC)))
	(setq dyA1 (* R (sin A1)))
	(setq dyA2 (* R (sin A2)))
    (setq dyAC (* R (sin AC)))
	
	(setq PxA1 (+ Pcex dxA1))
	(setq PyA1 (+ Pcey dyA1))

	(setq PxA2 (+ Pcex dxA2))
	(setq PyA2 (+ Pcey dyA2))

    (setq PCx (+ Pcex dxAC))
	(setq PCy (+ Pcey dyAC))
	(setq PC (list PCx PCy)) 
	
	(setq dx (- PxA2 PxA1))
	(setq dy (- PyA2 PyA1))
	(setq x2 (* dx dx))
	(setq y2 (* dy dy))


	(setq angle1  (- (atof (angtos AC 0 0)) 90)) 
	(setq arc1 (*(/ angle1 180) PI)) 
	)

	(progn
	
    
	(setq Px1 (cadr (assoc 10 lst)))
	(setq Py1 (caddr (assoc 10 lst)))
	(setq Px2 (cadr (assoc 11 lst)))
	(setq Py2 (caddr (assoc 11 lst)))

    (setq dx (- Px2 Px1))
	(setq dy (- Py2 Py1))
	(setq x2 (* dx dx))
	(setq y2 (* dy dy))

    ;;;得到在左边的点
    (if (> dx 0)
	    (progn (setq PxL Px1) (setq PxR Px2)(setq PyL Py1) (setq PyR Py2) (setq dxLR dx)(setq dyLR dy))
	    (progn (setq PxL Px2) (setq PxR Px1)(setq PyL Py2) (setq PyR Py1) (setq dxLR (* -1 dx))(setq dyLR (* -1 dy)))
    )
    
	(setq angle0  (angtos (atan dyLR dxLR) 0 0))
	(setq angle0 (atof angle0))
    (if (= Ltype "B")
       (cond 
           ((and (>= angle0 270) (< angle0 315)) (setq  Num 2) )
           ((and (>= angle0 315) (<= angle0 360))  (setq  Num 1))
           ((and (>= angle0 0) (< angle0 45))  (setq  Num 1))
           ((and (>= angle0 45)  (<= angle0 90)) (setq  Num 1))
	    )

	(progn  
     (initget (+ 1 2 4)) 
    (setq Num (getint "\n标注方向：") )
	;;;判断哪一个在左边
	)
    )
   
	(if (= Num 1) 
	   (progn (setq PCx (/(+ px1 Px2) 2 )) (setq PCy (/(+ py1 Py2) 2 )) (setq arc1 (atan dyLR dxLR)) )
	   (progn (setq PCx (/(+ px1 Px2) 2 )) (setq PCy (/(+ py1 Py2) 2 )) (setq arc1 (+ PI (atan dyLR dxLR))) )
     )
    (setq PC (list PLx PLy))
	(setq AC (+ arc1 (/ PI 2)) )
	(setq angle1 (*(/ arc1 PI) 180))
    )
	
)





(if (= Ltype "B")
(if  (or  (and (>= angle1 t1) (<= angle1 t2))  (and (>= angle1 t3) (<= angle1 t4)))
	(command "clayer" "S-BEAM-Y")
	(command "clayer" "S-BEAM-X")
)
(command "clayer" "S-BEAM-Y")
)

(if (= type "ARC")
(command "clayer" "S-BEAM-X")
)
    
(setq chklay2  (getvar "clayer"))
(setq angle2 (+ angle1 90))
(setq arc2 (*(/ angle2 180) PI))
(setq Px3 (+ PCx (* 1600 (cos arc2))))
(setq Py3 (+ PCy (* 1600 (sin arc2))))
(setq P3 (list Px3 Py3))

(setq PL1x (+ PCx (* -50 (cos arc1))))
(setq PL1y (+ PCy (* -50 (sin arc1))))


(setq PL1x (+ PL1x (* -120 (cos arc2))))
(setq PL1y (+ PL1y (* -120 (sin arc2))))
(setq PL1 (list PL1x PL1y))

(setq PL2x (+ Px3 (* -50 (cos arc1))))
(setq PL2y (+ Py3 (* -50 (sin arc1))))
(setq PL2 (list PL2x PL2y))

(command "line" PL1 PL2 "")
(command "change" "L" "" "p" "c" 211  "" ) ;引出线
(setq Px4 (+ PCx (* 1247.25 (cos arc2))))
(setq Py4 (+ PCy (* 1247.25 (sin arc2))))
(setq P4 (list Px4 Py4))
(setq Px5 (+ PCx (* 894.5 (cos arc2))))
(setq Py5 (+ PCy (* 894.5 (sin arc2))))
(setq P5 (list Px5 Py5))
(setq Px6 (+ PCx (* 541.75 (cos arc2))))
(setq Py6 (+ PCy (* 541.75 (sin arc2))))
(setq P6 (list Px6 Py6))


(command "textstyle" "TSSD_REIN")
(if (= BH 600) 
(command "text" "J" "TL" P3  "300" angle1 "KL1(1) 200x600")
(command "text" "J" "TL" P3  "300" angle1 "KL1(1) 200x400")
)
(command "change" "L" "" "p" "c" 211  "" )
(command "text" "J" "TL" P4  "300" angle1 "%%1326@100/200(2)")
(command "change" "L" "" "p" "c" 211  "" )
(command "text" "J" "TL" P5  "300" angle1 "2%%13214")
(command "change" "L" "" "p" "c" 211  "" )
(if (>= BH 600) 
	(progn
	(command "text" "J" "TL" P6  "300" angle1 "G4%%13212")
    (command "change" "L" "" "p" "c" 211  "" )
    )
)

(setq ii (+ ii 1))
)
)
)  
(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)
	


(defun CRYWBZ (Cont PO Ltype col ) ;;;插入原位标注 变量：左下 右下 中上
(SETVAR "CMDECHO" 0)

(setq chklay  (getvar "clayer"))


(setq ss (getvar "osmode"))
(setvar "osmode" 0)
(command "textstyle" "TSSD_REIN")
;;;选择所要移动引线
;;;根据文字对齐判断引线方向
(prompt "选择梁线\n")
(setq sel (ssget   '((-4 . "<or")(0 . "ARC")(0 . "LINE") (-4 . "or>")(-4 . "<or")(8 . "S-BEAM-LINE1") (8 . "S-BEAM-LINE2") (-4 . "or>")) ))
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii))  
(setq lst (entget first))
(setq type  (cdr (assoc 0 lst))) 

(if (= type "ARC")
	(progn
		
	(setq Pcex (cadr (assoc 10 lst)))
	(setq Pcey (caddr (assoc 10 lst)))
	(setq A1 (cdr (assoc 50 lst)))
	(setq A2 (cdr (assoc 51 lst)))
	(setq R (cdr (assoc 40 lst)))
    (if (> A1 A2)
				(progn 
					(if (< (- A1 A2) PI)
					(setq AC (/ (+ A1 A2) 2))
					(setq AC (/ (+ (- A1 (* PI 2)) A2) 2))
				    )
				)
			    (progn 
					(if (< (- A2 A1) PI)
					(setq AC (/ (+ A1 A2) 2))
					(setq AC (/ (+ (- A2 (* PI 2)) A1) 2))
			        )
			    )	
	)
	;;得到两端点和中点坐标
	(setq dxA1 (* R (cos A1)))
	(setq dxA2 (* R (cos A2)))
	(setq dxAC (* R (cos AC)))
	(setq dyA1 (* R (sin A1)))
	(setq dyA2 (* R (sin A2)))
    (setq dyAC (* R (sin AC)))
    

	(setq PxA1 (+ Pcex dxA1))
	(setq PyA1 (+ Pcey dyA1))

	(setq PA1 (list PxA1 PyA1))
   
	(setq PxA2 (+ Pcex dxA2))
	(setq PyA2 (+ Pcey dyA2))

	(setq PA2 (list PxA2 PyA2))

    (setq PCx (+ Pcex dxAC))
	(setq PCy (+ Pcey dyAC))
	(setq PC (list PCx PCy)) 
	
	(setq dx (- PxA2 PxA1))
	(setq dy (- PyA2 PyA1))
	(setq x2 (* dx dx))
	(setq y2 (* dy dy))

	
    (cond 
		((or (= PO "BL") (= PO "TL")) 
			(if (> A1 A2)
				(progn 
					(if (< (- A1 A2) PI)
					(progn (setq PLx PxA1) (setq PLy PyA1) (setq AL A1))
					(progn (setq PLx PxA2) (setq PLy PyA2) (setq AL A2))
				    )
				)
			    (progn 
					(if (< (- A2 A1) PI)
				    (progn (setq PLx PxA2) (setq PLy PyA2) (setq AL A2))
				    (progn (setq PLx PxA1) (setq PLy PyA1) (setq AL A1))
			        )
			    )	
			)
	     )
	     ((or(= PO "BR")(= PO "TR")) 
			(if (> A1 A2)
				(progn 
					(if (< (- A1 A2) PI)
				    (progn (setq PLx PxA2) (setq PLy PyA2) (setq AL A2))
					(progn (setq PLx PxA1) (setq PLy PyA1) (setq AL A1))
				    )
				)
			    (progn 
					(if (< (- A2 A1) PI)
					(progn (setq PLx PxA1) (setq PLy PyA1) (setq AL A1))
				    (progn (setq PLx PxA2) (setq PLy PyA2) (setq AL A2))
			        )
			    )
				
			)
	     )
	    ((or(= PO "TC") (= PO "BC") )
	    (progn (setq PLx PCx) (setq PLy PCy) (setq AL AC))
	     )
    )
    (setq PL (list PLx PLy))
    (setq angleC  (angtos (atan dy dx) 0 0))
	(setq angle1  (- (atof (angtos AL 0 0)) 90))
	(setq arc1 (*(/ angle1 180) PI)) 
	)
	(progn
    (setq Px1 (cadr (assoc 10 lst)))
	(setq Py1 (caddr (assoc 10 lst)))
	(setq Px2 (cadr (assoc 11 lst)))
	(setq Py2 (caddr (assoc 11 lst)))

    (setq dx (- Px2 Px1))
	(setq dy (- Py2 Py1))
	(setq x2 (* dx dx))
	(setq y2 (* dy dy))

    ;;;得到在左边的点
    (if (> dx 0)
	    (progn (setq PxL Px1) (setq PxR Px2)(setq PyL Py1) (setq PyR Py2) (setq dxLR dx)(setq dyLR dy))
	    (progn (setq PxL Px2) (setq PxR Px1)(setq PyL Py2) (setq PyR Py1) (setq dxLR (* -1 dx))(setq dyLR (* -1 dy)))
    )
    
	(setq angle0  (angtos (atan dyLR dxLR) 0 0))
	(setq angle0 (atof angle0))
    (if (= Ltype "B")
       (cond 
           ((and (>= angle0 270) (< angle0 315)) (setq  Num 2) )
           ((and (>= angle0 315) (<= angle0 360))  (setq  Num 1))
           ((and (>= angle0 0) (< angle0 45))  (setq  Num 1))
           ((and (>= angle0 45)  (<= angle0 90)) (setq  Num 1))
	    )

	(progn  
     (initget (+ 1 2 4)) 
    (setq Num (getint "\n标注方向：") )
	;;;判断哪一个在左边
	)
    )
   


	(cond 
       ((or (= PO "BL") (= PO "TL"))
	      (if (= Num 1)
					(progn (setq PLx PxL) (setq PLy PyL) (setq arc1 (atan dyLR dxLR)) )
					(progn (setq PLx PxR) (setq PLy PyR) (setq arc1 (+ PI (atan dyLR dxLR))) )  
		   )
       )
       ((or(= PO "BR")(= PO "TR"))
           (if (= Num 1)
	               (progn (setq PLx PxR) (setq PLy PyR) (setq arc1 (atan dyLR dxLR)) )
				   (progn (setq PLx PxL) (setq PLy PyL) (setq arc1 (+ PI (atan dyLR dxLR))) )  
            )
        )
        ((or(= PO "TC") (= PO "BC") )
        (if (= Num 1) 
	    (progn (setq PLx (/(+ px1 Px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (atan dyLR dxLR)) )
		 (progn (setq PLx (/(+ px1 Px2) 2 )) (setq PLy (/(+ py1 Py2) 2 )) (setq arc1 (+ PI (atan dyLR dxLR))) )
	     )
      )


    

     )
    (setq PL (list PLx PLy))
	(setq AL (+ arc1 (/ PI 2)) )
	(setq angle1 (*(/ arc1 PI) 180))
    )



		
	
)



(setq t1 45)
(setq t2 135)
(setq t3 225)
(setq t4 315)
(setq t0 90)



(if (= Ltype "B")
(if  (or  (and (>= angle1 t1) (<= angle1 t2))  (and (>= angle1 t3) (<= angle1 t4)))
	(command "clayer" "S-BEAM-Y")
	(command "clayer" "S-BEAM-X")
)
(command "clayer" "S-BEAM-Y")
)

(if (= type "ARC")
(command "clayer" "S-BEAM-X")
)

(cond 
    ((= PO "BL") 
   (setq PL1x (+ PLx (* 50 (cos AL))))
   (setq PL1x (+ PL1x (* 50 (cos arc1))))
   (setq PL1y (+ PLy (* 50 (sin AL))))
   (setq PL1y (+ PL1y (* 50 (sin arc1))))
)
    ((= PO "BR")
   (setq PL1x (+ PLx (* 50 (cos AL))))
   (setq PL1x (+ PL1x (* -50 (cos arc1))))
   (setq PL1y (+ PLy (* 50 (sin AL))))
   (setq PL1y (+ PL1y (* -50 (sin arc1))))
)
    ((= PO "TL") 
   (setq PL1x (+ PLx (* -50 (cos AL))))
   (setq PL1x (+ PL1x (* 50 (cos arc1))))
   (setq PL1y (+ PLy (* -50 (sin AL))))
   (setq PL1y (+ PL1y (* 50 (sin arc1))))
)
  ((= PO "TR")
   (setq PL1x (+ PLx (* -50 (cos AL))))
   (setq PL1x (+ PL1x (* -50 (cos arc1))))
   (setq PL1y (+ PLy (* -50 (sin AL))))
   (setq PL1y (+ PL1y (* -50 (sin arc1))))
)

    ((= PO "TC")
   (setq PL1x (+ PLx (* -50 (cos AL))))
   (setq PL1x (+ PL1x (* 0 (cos arc1))))
   (setq PL1y (+ PLy (* -50 (sin AL))))
   (setq PL1y (+ PL1y (* 0 (sin arc1))))
)
    ((= PO "BC")
   (setq PL1x (+ PLx (* 50 (cos AL))))
   (setq PL1x (+ PL1x (* 0 (cos arc1))))
   (setq PL1y (+ PLy (* 50 (sin AL))))
   (setq PL1y (+ PL1y (* 0 (sin arc1))))
)
)
(setq PL1 (list PL1x PL1y))

(command "text" "J" PO PL1  "300" angle1 Cont)
(command "change" "L" "" "p" "c" col   "" )
(setq ii (+ ii 1))
)
)
)
(setvar "osmode" ss)
(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)

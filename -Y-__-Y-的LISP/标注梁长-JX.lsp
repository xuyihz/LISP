;;;; 姜雄 2016-06-07 星期二 天气晴 
;;;;显示梁长
;;;选中条件不再苛刻  
(defun C:73 ( / #k %k i gr n pt  first lst)
(SETVAR "CMDECHO" 0)

(setq chklay  (getvar "clayer"))
(setq chklay2 (tblsearch "layer"  "-Y-__-Y-的信息图层")) 
(if (= chklay2 nil) (command "layer" "n" "-Y-__-Y-的信息图层" "c" "7" "-Y-__-Y-的信息图层"  "") (command "clayer" "-Y-__-Y-的信息图层"))

(setq new0 0)(setq  new1 3)

;;;选择所要移动引线
;;;根据文字对齐判断引线方向
(prompt "选择直线\n")
(setq sel (ssget  '((0 . "LINE")(-4 . "<or")(8 . "S-BEAM-LINE1") (8 . "S-BEAM-LINE2") (-4 . "or>")) ))


(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii))  
(setq lst (entget first))
(setq Px1 (cadr (assoc 10 lst)))
(setq Py1 (caddr (assoc 10 lst)))
(setq Px2 (cadr (assoc 11 lst)))
(setq Py2 (caddr (assoc 11 lst)))
(setq dx (- Px2 Px1))
(setq dy (- Py2 Py1))
(setq x2 (* dx dx))
(setq y2 (* dy dy))

(setq l (sqrt (+ x2 y2)))
(setq angle1  (angtos (atan dy dx) 0 0))
(setq PCx (/(+ px1 Px2) 2 ))
(setq PCy (/(+ py1 Py2) 2 ))
(setq PC (list PCx PCy))

(setq angle1 (atof angle1))
(if (and (> angle1 90 ) (<= angle1 270)) (setq angle1 (- angle1 180)))

(command "text" "J" "TC" PC  "300" angle1 (rtos l 2 0))
(setq ii (+ ii 1))
)
)

(command "clayer" chklay)
(SETVAR "CMDECHO" 1)
)

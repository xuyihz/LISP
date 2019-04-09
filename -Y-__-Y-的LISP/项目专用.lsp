(defun c:5111( / sel aa ii first lst laname new2);;t柱填充相互转换(改变填充比例没用)
(SETVAR "CMDECHO" 0)

(setq sel (ssget ) ) 
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii)) 
(setq lst (entget first))
(setq typename (cdr (assoc 0 lst))) 
(setq hatchname (cdr (assoc 2 lst))) 
(setq hatchrat (cdr (assoc 41 lst)))
(if (= typename "HATCH")
(progn
(cond    
((=  hatchname "SOLID")(setq new2 (cons 2 "DOTS"))) ((= hatchname "DOTS")(setq new2 (cons 2 "SOLID")))
 )

)
(setq lst (subst new2 (assoc 2 lst) lst))
(entmod lst) 

)
(setq ii (+ ii 1))
)
)
)  
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)





(defun c:751( / P1 P2 LType );;;;长边为X
(SETVAR "CMDECHO" 0)
(setq LX 400)
(setq LY 200)
(setq Laname "S-WALL-BELINE") 
(setq CNum 6)
(setq Pc (getpoint "选取左上角点！\n"))
(CRJX Pc 0 0  LX  (* LY -1) Laname Cnum)

(setq Laname  "S-WALL-BEHATCH") 
(setq chklay (tblsearch "layer" Laname))
(if (= chklay nil) (command "layer" "m" Laname "c" 30 """") (command "layer" "s" Laname ""))
(command "hatch" "solid" "L" "") 
(setvar "CMDECHO" 1)
(prompt "程序运行正确2\n")
)

(defun c:755( / P1 P2 LType )
(SETVAR "CMDECHO" 0)
(setq LX 400)
(setq Laname "S-WALL-BELINE") 
(setq CNum 6)
(setq Pc (getpoint "选取截面中心点！\n"))
(CRJX Pc (/ LX -2) (/ LX 2) (/ LX 2) (/ LX -2) Laname Cnum)

(setq Laname "S-WALL-BEHATCH") 
(setq chklay (tblsearch "layer" Laname))
(if (= chklay nil) (command "layer" "m" Laname "c" 30 """") (command "layer" "s" Laname ""))
(command "hatch" "solid" "L" "") 
(setvar "CMDECHO" 1)
(prompt "程序运行正确2\n")
)

(defun c:752( / P1 P2 LType );;;;长边为X
(SETVAR "CMDECHO" 0)
(setq LX 400)
(setq LY 200)
(setq Laname "S-WALL-BELINE") 
(setq CNum 6)
(setq Pc (getpoint "选取截面右上角点！\n"))
(CRJX Pc 0 0 (/ LX -1) (/ LY -1) Laname Cnum)

(setq Laname  "S-WALL-BEHATCH") 
(setq chklay (tblsearch "layer" Laname))
(if (= chklay nil) (command "layer" "m" Laname "c" 30 """") (command "layer" "s" Laname ""))
(command "hatch" "solid" "L" "") 
(setvar "CMDECHO" 1)
(prompt "程序运行正确2\n")
)

(defun c:753( / P1 P2 LType );;;;长边为y
(SETVAR "CMDECHO" 0)
(setq LX 200)
(setq LY 400)
(setq Laname  "S-WALL-BELINE") 
(setq CNum 6)
(setq Pc (getpoint "选取截面左上角点！\n"))
(CRJX Pc 0 0 (/ LX 1) (/ LY -1) Laname Cnum)

(setq Laname "S-WALL-BEHATCH") 
(setq chklay (tblsearch "layer" Laname))
(if (= chklay nil) (command "layer" "m" Laname "c" 30 """") (command "layer" "s" Laname ""))
(command "hatch" "solid" "L" "") 
(setvar "CMDECHO" 1)
(prompt "程序运行正确2\n")
)


(defun c:754( / P1 P2 LType );;;;长边为Y
(SETVAR "CMDECHO" 0)
(setq LX 200)
(setq LY 400)
(setq Laname  "S-WALL-BELINE") 
(setq CNum 6)
(setq Pc (getpoint "选取截面左上角点！\n"))
(CRJX Pc 0 0 (/ LX 1) (/ LY 1) Laname Cnum)

(setq Laname  "S-WALL-BEHATCH") 
(setq chklay (tblsearch "layer" Laname))
(if (= chklay nil) (command "layer" "m" Laname "c" 30 """") (command "layer" "s" Laname ""))
(command "hatch" "solid" "L" "") 
(setvar "CMDECHO" 1)
(prompt "程序运行正确2\n")
)



(defun CRJX(Pc D1 D2  D3 D4 Laname Cnum) ;;;插入矩形
;;;;;; I-获取桩基中心点

(setq PcX (car Pc))
(setq PcY (cadr Pc))

(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)

;;;;;; II-插入填充
(setq chklay (tblsearch "layer" Laname))
(if (= chklay nil) (command "layer" "m" Laname "c" Cnum """") (command "layer" "s" Laname "")) 

(setq P1X (+ PcX D1 ) )
(setq P1Y (+ PcY D2 ) )

(setq P2X (+ PcX D3 ) )
(setq P2Y (+ PcY D4 ) )
(setq P1 (list P1X P1Y ))
(setq P2 (list P2X P2Y ))
(command "rectangle" "w" 20  P1 P2)

(setvar "OSMODE" ss)
)


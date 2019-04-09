;;;; 姜雄 2015-12-18 星期五 天气晴
;;;; 姜雄 2016-06-12 星期一 天气雨

(defun c:76( / P1 P2 LType ) ;;;;;插入标高
(SETVAR "CMDECHO" 0)
(setq chklay  (getvar "clayer"))
(setq ss (getvar "osmode"))

;;;;;; I-获取插入点
;;;;;; II-插入
(setq Laname (strcat "S-SLAB-TEXT")) 
(setq chklay2 (tblsearch "layer" Laname))
(if (= chklay2 nil) (command "layer" "m" Laname "c" 7 """") (command "layer" "s" Laname "")) 
(setq P1 (getpoint "选取标高基点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq DX 250 )
(setq DY 250 )
(setq P2X (- P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P3X (+ P1X DX ) )
(setq P3Y (+ P1Y DY ) )
(setq P4X (+ P2X 1200 ) )
(setq P4Y P2Y)
(setq P2 (list P2X P2Y ))
(setq P3 (list P3X P3Y ))
(setq P4 (list P4X P4Y ))
(setq P5X P4X)
(setq P5Y (+ P4Y 50 ) )
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
(command "text" "J" "BR" P5  "300" "0" "标高")


(command "clayer" chklay)
(setvar "osmode" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)




(defun C:99()  ;;;绘制多线
(SETVAR "CMDECHO" 0)
(setq chklay  (getvar "clayer"))	
(setq P1 (getpoint "选取多线第一点！\n"))
(setq P2 (getpoint P1 "选取多线第二点！\n"))
(setq Laname (strcat "S-BEAM-LINE2"))
(command "layer" "s" Laname "")
(command "mline" "J" "Z" P1 P2 "")
(command "explode" "L")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
)


(defun C:992()  ;;;绘制多线
(SETVAR "CMDECHO" 0)

(setq P1 (getpoint "选取多线第一点！\n"))
(setq P2 (getpoint P1 "选取多线第二点！\n"))
(command "mline" "J" "Z" P1 P2 "")
(command "explode" "L")

(setvar "CMDECHO" 1)
)


(defun c:88( / P1 P2 LType );;;绘制贯通柱
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))

(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)
(defun c:882( / P1 P2 LType );;;绘制边线加粗贯通柱
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))



(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)

(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:886( / P1 P2 LType );;;以中心点为准绘制柱子
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子中心点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(initget (+ 1 2 )) 
(setq DX (getint "\n输入宽：") )
(setq DY (getint "\n输入高：") )
(setq P2X (- P1X (/ DX 2) ))
(setq P2Y (- P1Y (/ DY 2)) )
(setq P2 (list P2X P2Y ))
(setq P3X (+ P1X (/ DX 2) ))
(setq P3Y (+ P1Y (/ DY 2)) )
(setq P3 (list P3X P3Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:887( / P1 P2 LType );;;绘制柱子
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(initget (+ 1 2 )) 
(setq DX (getint "\n输入水平偏移：") )
(setq DY (getint "\n输入竖向偏移：") )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:884( / P1 P2 LType );;;绘制端柱
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "S" "S-WALL-BELINE" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "S" "S-WALL-BEHATCH" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)


(defun c:89( / P1 P2 LType );;;绘制上抬柱
(SETVAR "CMDECHO" 0) 
(setvar "plinewid" 20)
(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))


(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" P1 P2)
(command "layer" "m" "S-COLU-HATCH2" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "plinewid" 0)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:892( / P1 P2 LType );;;绘制上抬柱
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))


(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "m" "S-COLU-HATCH2" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:991( / P1 P2 LType );;;以中心点为准绘制柱子
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子中心点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(initget (+ 1 2 )) 
(setq DX 240 )
(setq DY 240 )
(setq P2X (- P1X (/ DX 2) ))
(setq P2Y (- P1Y (/ DY 2)) )
(setq P2 (list P2X P2Y ))
(setq P3X (+ P1X (/ DX 2) ))
(setq P3Y (+ P1Y (/ DY 2)) )
(setq P3 (list P3X P3Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE1" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH2" "c" "7" "" "")
(command "hatch" "solid" (entlast) "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

















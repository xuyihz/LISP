;;;; 姜雄 2015-12-18 星期五 天气晴
;;;; 姜雄 2016-06-12 星期一 天气雨





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
(defun c:882( / P1 P2 LType );;;绘制边线贯通柱
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

(defun c:885( / P1 P2 LType );;;以中心点为准绘制柱子
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子中心点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
 
(setq DX 400)
(setq DY 400)
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


(defun c:87( / P1 P2 LType );;;绘制不贯通柱
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))


(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:872( / P1 P2 LType );;;绘制不贯通柱
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2 (getcorner P1 "选取柱子第二角点！\n"))


(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)

(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:875( / P1 P2 LType );;;以中心点为准绘制柱子
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
;;;;;; I-获取柱子尺寸与位置 
(setq P1 (getpoint "选取柱子中心点！\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq DX 400)
(setq DY 400)
(setq P2X (- P1X (/ DX 2) ))
(setq P2Y (- P1Y (/ DY 2)) )
(setq P2 (list P2X P2Y ))
(setq P3X (+ P1X (/ DX 2) ))
(setq P3Y (+ P1Y (/ DY 2)) )
(setq P3 (list P3X P3Y ))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "50" ""  "L" "") 
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:876( / P1 P2 LType );;;以中心点为准绘制柱子
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
(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P2 P3)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:877( / P1 P2 LType );;;绘制柱子
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
(command "layer" "m" "S-COLU-LINE2" "c" "6" "" "")
(command "rectangle" "w" 0 P1 P2)
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
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


(command "layer" "m" "S-COLU-LINE" "c" "6" "" "")
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


(command "layer" "m" "S-COLU-LINE" "c" "6" "" "")
(command "rectangle" "w" 20 P1 P2)
(command "layer" "m" "S-COLU-HATCH2" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:83( );;;填充上一个实体（墙 柱）
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
(command "layer" "S" "S-WALL-BEHATCH" "")
(command "hatch" "solid" "L" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)
(defun c:832( );;;填充选中实体（墙 柱）
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "选取内部点！\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "solid" "LA" "S-WALL-BEHATCH" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:85( );;;填充上一个实体（墙 柱）
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "solid" "L" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)
(defun c:852( );;;填充选中实体（墙 柱）
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "选取内部点！\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "solid" "LA" "S-COLU-HATCH" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:84( );;;填充上一个非贯通（墙 柱）
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
(command "layer" "m" "S-COLU-HATCH" "c" "30" "" "")
(command "hatch" "DOTS" "1000" ""  "L" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)
(defun c:842( );;;填充选中非贯通（墙 柱）
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "选取内部点！\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "DOTS" "1000" "" "LA" "S-COLU-HATCH" "") 
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:86( );;;填充上一个上抬（墙 柱）
(SETVAR "CMDECHO" 0) 

(setq chklay  (getvar "clayer"))
(command "layer" "m" "S-COLU-HATCH2" "c" "7" "" "")
(command "hatch" "solid" "L" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

(defun c:862( );;;填充选中上抬（墙 柱）
(SETVAR "CMDECHO" 0) 
(setq pt (getpoint "选取内部点！\n"))
(setq chklay  (getvar "clayer"))
(command "bhatch" pt "p" "solid" "LA" "S-COLU-HATCH2" "")
(command "clayer" chklay)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)


















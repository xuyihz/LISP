;;;; 姜雄 2015-11-10 星期二 天气阴
;;;;绘制独基
;;;; YYHZDJ YY为固定前缀，HZDJ即绘制独基，采用输入编号的方式
;;; 平面表示法绘制独立基础
;;; 流程：选中柱子，输入独基，获取文字原始坐标，然后更新之，继而改变文字位置
;;; 需要打开捕捉
;;; 本程序暂时只适合单阶坡形基础 ，适当变换即可适用于更高阶次基础或坡形基础


;;;注意选择标注样式为100


(defun C:545()
(SETVAR "CMDECHO" 0) 
(setq NumMax 34) ;;;需要提前输入的编号
;;;;;; I-获取柱子尺寸与位置 
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 1)
(setq P1 (getpoint "选取柱子第一角点！\n"))
(setq P2(getcorner P1 "选取柱子第二角点！\n"))
;;;上述两行统一完成了选取柱子各角点坐标工作
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq PcX (/ (+ P1X P2X) 2))
(setq PcY (/ (+ P1Y P2Y) 2))

;;;;;; II-输入独基编号
(initget (+ 1 2 4)) 
(setq Num (getint "独基编号：") )

;;;确定尺寸
(if (< Num NumMax) 
(Progn
(cond
((= Num 1) (Progn (setq LX 1800) (setq LY 1800)(setq T1 "DJ01")))						
((= Num 2) (Progn (setq LX 1800) (setq LY 1800)(setq T1 "DJ01")))						
((= Num 3) (Progn (setq LX 2750) (setq LY 2750)(setq T1 "DJ03")))						
((= Num 4) (Progn (setq LX 2000) (setq LY 2000)(setq T1 "DJ01")))						
((= Num 5) (Progn (setq LX 2200) (setq LY 2200)(setq T1 "DJ01")))						
((= Num 6) (Progn (setq LX 3100) (setq LY 3100)(setq T1 "DJ04")))						
((= Num 7) (Progn (setq LX 2400) (setq LY 2400)(setq T1 "DJ02")))						
((= Num 8) (Progn (setq LX 3250) (setq LY 3250)(setq T1 "DJ05")))						
((= Num 9) (Progn (setq LX 2200) (setq LY 2200)(setq T1 "DJ01")))						
((= Num 10) (Progn (setq LX 3000) (setq LY 3000)(setq T1 "DJ04")))						
((= Num 11) (Progn (setq LX 2200) (setq LY 2200)(setq T1 "DJ01")))						
((= Num 12) (Progn (setq LX 2650) (setq LY 2650)(setq T1 "DJ04")))						
((= Num 13) (Progn (setq LX 1750) (setq LY 1750)(setq T1 "DJ02")))						
((= Num 14) (Progn (setq LX 2000) (setq LY 2000)(setq T1 "DJ03")))						
((= Num 15) (Progn (setq LX 1550) (setq LY 1550)(setq T1 "DJ01")))						
((= Num 16) (Progn (setq LX 1750) (setq LY 1750)(setq T1 "DJ01")))						
((= Num 17) (Progn (setq LX 1700) (setq LY 1700)(setq T1 "DJ01")))						
((= Num 18) (Progn (setq LX 1850) (setq LY 1850)(setq T1 "DJ01")))						
((= Num 19) (Progn (setq LX 1850) (setq LY 1850)(setq T1 "DJ01")))						
((= Num 20) (Progn (setq LX 1800) (setq LY 1800)(setq T1 "DJ01")))						
((= Num 21) (Progn (setq LX 1450) (setq LY 1450)(setq T1 "DJ02")))						
((= Num 22) (Progn (setq LX 1300) (setq LY 1300)(setq T1 "DJ02")))						
((= Num 23) (Progn (setq LX 1400) (setq LY 1400)(setq T1 "DJ01")))						
					
								
)


	  ;          ((= Num 1)  (Progn (setq LX 1800 ) (setq LY 1800)))
   ;   ((= Num 2)  (Progn (setq LX 2200 ) (setq LY 2200)))
	  ;((= Num 3)  (Progn (setq LX 2700 ) (setq LY 2700)))
   ;   ((= Num 4)  (Progn (setq LX 2900 ) (setq LY 2900)))
   ;   ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
   ;   ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
   ;   ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
   ;   ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
   ;   ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300))) 

;;; 西展厅
   ;   ((= Num 1)  (Progn (setq LX 2300 ) (setq LY 2300)))
   ;   ((= Num 2)  (Progn (setq LX 2600 ) (setq LY 2600)))
	  ;((= Num 3)  (Progn (setq LX 2900 ) (setq LY 2900)))
   ;   ((= Num 4)  (Progn (setq LX 3200 ) (setq LY 3200)))
   ;   ((= Num 5)  (Progn (setq LX 3700 ) (setq LY 3700)))
   ;   ((= Num 6)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 7)  (Progn (setq LX 4300 ) (setq LY 4300)))



;;; 主楼
   ;   ((= Num 1)  (Progn (setq LX 1700 ) (setq LY 1700)))
   ;   ((= Num 2)  (Progn (setq LX 3200 ) (setq LY 3200)))
	  ;((= Num 3)  (Progn (setq LX 3400 ) (setq LY 3400)))
   ;   ((= Num 4)  (Progn (setq LX 3800 ) (setq LY 3800)))
   ;   ((= Num 5)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 6)  (Progn (setq LX 4300 ) (setq LY 4300)))
   ;   ((= Num 7)  (Progn (setq LX 4700 ) (setq LY 4700)))
   ;   ((= Num 8)  (Progn (setq LX 4900 ) (setq LY 4900)))

;;; 大堂
   ;   ((= Num 1)  (Progn (setq LX 2000 ) (setq LY 2000)))
   ;   ((= Num 2)  (Progn (setq LX 2900 ) (setq LY 2900)))
	  ;((= Num 3)  (Progn (setq LX 3000 ) (setq LY 3000)))
   ;   ((= Num 4)  (Progn (setq LX 3500 ) (setq LY 3500)))
   ;   ((= Num 5)  (Progn (setq LX 3600 ) (setq LY 3600)))



   ;         ((= Num 1)  (Progn (setq LX 1800 ) (setq LY 1800)))
   ;   ((= Num 2)  (Progn (setq LX 2200 ) (setq LY 2200)))
	  ;((= Num 3)  (Progn (setq LX 2700 ) (setq LY 2700)))
   ;   ((= Num 4)  (Progn (setq LX 2900 ) (setq LY 2900)))
   ;   ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
   ;   ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
   ;   ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
   ;   ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
   ;   ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
   ;   ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300)))




(setvar "OSMODE" 0)
;;;;;; III-绘制独基矩形
(setq NewP1X (- PcX (/ LX 2) ) )
(setq NewP1Y (+ PcY (/ LY 2) ) )
(setq NewP2X (+ PcX (/ LX 2) ) )
(setq NewP2Y (- PcY (/ LY 2) ) )
(setq NewP1 (list NewP1X NewP1Y ))
(setq NewP2 (list NewP2X NewP2Y ))
(command "clayer" "S-FON-LINE1")
(command "rectangle" NewP1 NewP2)

;;;;;; V-绘制引出线
(setq LP1 (list (+ PcX 200)  (- NewP1Y 200)));;;线段下端点
(setq LP2 (list (+ PcX 200)  (+ NewP1Y 500)));;;线段上端点
(command "clayer" "S-FON-TEXT")
(command "line" LP1 LP2 "")



(command "clayer" "S-FON-TEXT")
(command "textstyle" "TSSD_REIN" "")
(setq LP5 (list (+ PcX 250)  (+ NewP1Y 240)));;;第一行右端点
(setq LP6 (list (+ PcX 250)  (+ NewP1Y 450)));;;第二行右端点

;;;确定文字


(command "text" LP5  "300" "0" T1)


)
)


(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

;;;;;;调试部分代码
;;;(command "dimlinear" DXP1 DXP2   "400" "")
;;;(setq DXP1 '(0 0))
;;;(setq DXP2 '(1000 0 ))

;;;(command "text" "0,0"  "300" "" "B: X&Y:12@150")
;;;(command "text" "0,0"  "300" "" "")



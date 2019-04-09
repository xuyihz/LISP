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
	;;;11#楼
            ((= Num 1)  (Progn (setq LX 1000 ) (setq LY 1000)))
      ((= Num 2)  (Progn (setq LX 2000 ) (setq LY 2000)))
	  ((= Num 3)  (Progn (setq LX 2200 ) (setq LY 2200)))
      ((= Num 4)  (Progn (setq LX 2200 ) (setq LY 2200)))
      ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
      ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
      ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
      ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
      ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
      ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300)))

)

	;;;;7#楼
 ;           ((= Num 1)  (Progn (setq LX 1400 ) (setq LY 1400)))
 ;     ((= Num 2)  (Progn (setq LX 2000 ) (setq LY 2000)))
	;  ((= Num 3)  (Progn (setq LX 2000 ) (setq LY 2000)))
 ;     ((= Num 4)  (Progn (setq LX 900 ) (setq LY 900)))
 ;     ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
 ;     ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
 ;     ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
 ;     ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
 ;     ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
 ;     ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300)))

	;;;;5#楼
 ;           ((= Num 1)  (Progn (setq LX 900 ) (setq LY 900)))
 ;     ((= Num 2)  (Progn (setq LX 1800 ) (setq LY 1800)))
	;  ((= Num 3)  (Progn (setq LX 2000 ) (setq LY 2000)))
 ;     ((= Num 4)  (Progn (setq LX 900 ) (setq LY 900)))
 ;     ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
 ;     ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
 ;     ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
 ;     ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
 ;     ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
 ;     ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300)))

 ;;;;9#楼
 ;           ((= Num 1)  (Progn (setq LX 1300 ) (setq LY 1300)))
 ;     ((= Num 2)  (Progn (setq LX 2000 ) (setq LY 2000)))
	;  ((= Num 3)  (Progn (setq LX 2000 ) (setq LY 2000)))
 ;     ((= Num 4)  (Progn (setq LX 900 ) (setq LY 900)))
 ;     ((= Num 5)  (Progn (setq LX 3200 ) (setq LY 3200)))
 ;     ((= Num 6)  (Progn (setq LX 3300 ) (setq LY 3300)))
 ;     ((= Num 7)  (Progn (setq LX 3700 ) (setq LY 3700)))
 ;     ((= Num 8)  (Progn (setq LX 3900 ) (setq LY 3900)))
 ;     ((= Num 9)  (Progn (setq LX 4000 ) (setq LY 4000)))
 ;     ((= Num 10)  (Progn (setq LX 4300 ) (setq LY 4300)))





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
(cond  
	((= Num 1)  (Progn (setq T1 "DJ01" ) (setq T2 "B: X&Y:12@200")))
    ((= Num 2)  (Progn (setq T1 "DJ02" ) (setq T2 "B: X&Y:12@200")))
    ((= Num 3)  (Progn (setq T1 "DJ03") (setq T2 "")))
    ((= Num 4)  (Progn (setq T1 "DJ04" ) (setq T2 "B: X&Y:12@150")))
    ((= Num 5)  (Progn (setq T1 "DJ05" ) (setq T2 "B: X&Y:12@150")))
    ((= Num 6)  (Progn (setq T1 "DJ06" ) (setq T2 "B: X&Y:12@200")))
    ((= Num 7)  (Progn (setq T1 "DJ07" ) (setq T2 "B: X&Y:12@200")))
    ((= Num 8)  (Progn (setq T1 "DJ08" ) (setq T2 "B: X&Y:12@150")))
    ((= Num 9)  (Progn (setq T1 "DJ09" ) (setq T2 "B: X&Y:12@200")))
    ((= Num 10)  (Progn (setq T1 "DJ10" ) (setq T2 "B: X&Y:12@200")))
        ((= Num 11)  (Progn (setq T1 "DJ11" ) (setq T2 "B: X&Y:12@200")))
    ((= Num 12)  (Progn (setq T1 "DJ12" ) (setq T2 "B: X&Y:12@200")))
        
)

(command "text" LP5  "300" "" T1)


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



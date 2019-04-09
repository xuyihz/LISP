;;;; 姜雄 2015-11-10 星期二 天气阴
;;;;绘制独基
;;;; YYHZDJ YY为固定前缀，HZDJ即绘制独基，采用输入编号的方式
;;; 平面表示法绘制独立基础
;;; 流程：选中柱子，输入独基，获取文字原始坐标，然后更新之，继而改变文字位置
;;; 需要打开捕捉
;;; 本程序暂时只适合单阶坡形基础 ，适当变换即可适用于更高阶次基础或坡形基础


;;;注意选择标注样式为100


(defun c:546()
(SETVAR "CMDECHO" 0) 
(setq NumMax 34) ;;;需要提前输入的编号
;;;;;; I-获取柱子尺寸与位置 
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
(cond ((= Num 1)  (Progn (setq LX 1300 ) (setq LY 1300)))
      ((= Num 2)  (Progn (setq LX 900 ) (setq LY 1300)))
      ((= Num 3)  (Progn (setq LX 1300 ) (setq LY 1300)))
      ((= Num 4)  (Progn (setq LX 1600 ) (setq LY 1050)))
      ((= Num 5)  (Progn (setq LX 1300 ) (setq LY 1700)))
      ((= Num 6)  (Progn (setq LX 1800 ) (setq LY 1600)))
      ((= Num 7)  (Progn (setq LX 1800 ) (setq LY 1600)))
      ((= Num 8)  (Progn (setq LX 1650 ) (setq LY 1650)))
      ((= Num 9)  (Progn (setq LX 1200 ) (setq LY 850)))
      ((= Num 10)  (Progn (setq LX 1150 ) (setq LY 1100)))
      ((= Num 11)  (Progn (setq LX 1050 ) (setq LY 1050)))
      ((= Num 12)  (Progn (setq LX 850 ) (setq LY 850)))
      ((= Num 13)  (Progn (setq LX 1550 ) (setq LY 1550)))
      ((= Num 14)  (Progn (setq LX 1600 ) (setq LY 1150)))
      ((= Num 15)  (Progn (setq LX 1250 ) (setq LY 1300)))
      ((= Num 16)  (Progn (setq LX 1300 ) (setq LY 1200)))
      ((= Num 17)  (Progn (setq LX 1000 ) (setq LY 1150)))
      ((= Num 18)  (Progn (setq LX 1300 ) (setq LY 1400)))
      ((= Num 19)  (Progn (setq LX 1100 ) (setq LY 1500)))
      ((= Num 20)  (Progn (setq LX 1350 ) (setq LY 1150)))
      ((= Num 21)  (Progn (setq LX 1100 ) (setq LY 1450)))
      ((= Num 22)  (Progn (setq LX 1850 ) (setq LY 1550)))
      ((= Num 23)  (Progn (setq LX 1800 ) (setq LY 1400)))
      ((= Num 24)  (Progn (setq LX 1600 ) (setq LY 1300)))
      ((= Num 25)  (Progn (setq LX 1350 ) (setq LY 1550)))
      ((= Num 26)  (Progn (setq LX 1350 ) (setq LY 1550)))
      ((= Num 27)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 28)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 29)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 30)  (Progn (setq LX 1300 ) (setq LY 1150)))
      ((= Num 31)  (Progn (setq LX 1400 ) (setq LY 1500)))
      ((= Num 32)  (Progn (setq LX 1050 ) (setq LY 1300)))
      ((= Num 33)  (Progn (setq LX 1050 ) (setq LY 850)))
)




;;;;;; III-绘制独基矩形
(setq NewP1X (- PcX (/ LX 2) ) )
(setq NewP1Y (+ PcY (/ LY 2) ) )
(setq NewP2X (+ PcX (/ LX 2) ) )
(setq NewP2Y (- PcY (/ LY 2) ) )
(setq NewP1 (list NewP1X NewP1Y ))
(setq NewP2 (list NewP2X NewP2Y ))
(command "clayer" "S-FON-LINE1")
(command "rectangle" NewP1 NewP2)

;;;;;; IV-标注
(command "clayer" "S-FON-DIM")
;;;横向
(setq DXP1 (list NewP1X NewP2Y ))
(setq DXP2 (list P1X NewP2Y ))
(setq DXP3 (list P2X NewP2Y ))
(setq DXP4 NewP2)
(setq DXPend1 (list NewP1X (- NewP2Y 500) ))
(setq DXPend2 (list NewP1X (- NewP2Y 1000) ))
(command "dimlinear" DXP1  DXP2 DXPend1)
(command "dimcontinue" DXP3  DXP4 "" "")
(command "dimlinear" DXP1  DXP4 DXPend2)

;;;纵向
(setq DYP1 NewP1)
(setq DYP2 (list NewP1X P1Y ))
(setq DYP3 (list NewP1X P2Y ))
(setq DYP4 (list NewP1X NewP2Y ))
(setq DYPend1 (list (- NewP1X 500) NewP1Y ))
(setq DYPend2 (list (- NewP1X 1000) NewP1Y ))
(command "dimlinear" DYP1  DYP2 DYPend1)
(command "dimcontinue" DYP3  DYP4 "" "")
(command "dimlinear" DYP1  DYP4 DYPend2)

;;;;;; V-绘制引出线
(setq LP1 (list (+ PcX 200)  (- NewP1Y 200)));;;线段下端点
(setq LP2 (list (+ PcX 200)  (+ NewP1Y 1200)));;;线段上端点
(command "clayer" "S-FON-TEXT")
(command "line" LP1 LP2 "")

;;;;;; V-绘制文字辅助线
(setq LP3 (list (+ PcX 200)  (+ NewP1Y 950)));;;线段左端点
(setq LP4 (list (+ PcX 400)  (+ NewP1Y 950)));;;线段右端点
(command "clayer" "-Y-__-Y-的辅助图层")
(command "line" LP3 LP4 "")


(command "clayer" "S-COLU-TEXT")
(command "textstyle" "TSSD_REIN" "")
(setq LP5 (list (+ PcX 400)  (+ NewP1Y 950)));;;第一行右端点
(setq LP6 (list (+ PcX 400)  (+ NewP1Y 450)));;;第二行右端点

;;;确定文字
(cond  ((= Num 1)  (Progn (setq T1 "DJ03 300" ) (setq T2 "B: X&Y:12@200")))
       ((= Num 2)  (Progn (setq T1 "DJ02 250" ) (setq T2 "B: X&Y:12@200")))
       ((= Num 3)  (Progn (setq T1 "DJ03") (setq T2 "")))
       ((= Num 4)  (Progn (setq T1 "DJ07 350" ) (setq T2 "B: X&Y:12@150")))
       ((= Num 5)  (Progn (setq T1 "DJ08 400" ) (setq T2 "B: X&Y:12@150")))
       ((= Num 6)  (Progn (setq T1 "DJ09 450" ) (setq T2 "B: X&Y:12@150")))
       ((= Num 7)  (Progn (setq T1 "DJ09" ) (setq T2 "")))
       ((= Num 8)  (Progn (setq T1 "DJ08" ) (setq T2 "")))
       ((= Num 9)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 10)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 11)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 12)  (Progn (setq T1 "DJ01 200" ) (setq T2 "B: X&Y:12@200")))
       ((= Num 13)  (Progn (setq T1 "DJ07" ) (setq T2 "")))
       ((= Num 14)  (Progn (setq T1 "DJ06" ) (setq T2 "")))
       ((= Num 15)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 16)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 17)  (Progn (setq T1 "DJ02" ) (setq T2 "")))
       ((= Num 18)  (Progn (setq T1 "DJ05" ) (setq T2 "B: X&Y:12@200")))
       ((= Num 19)  (Progn (setq T1 "DJ06" ) (setq T2 "B: X&Y:12@175")))
       ((= Num 20)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 21)  (Progn (setq T1 "DJ05" ) (setq T2 "")))
       ((= Num 22)  (Progn (setq T1 "DJ10 450" ) (setq T2 "B: X:12@130 Y:12@150")))
       ((= Num 23)  (Progn (setq T1 "DJ10" ) (setq T2 "")))
       ((= Num 24)  (Progn (setq T1 "DJ08" ) (setq T2 "")))
       ((= Num 25)  (Progn (setq T1 "DJ04 300" ) (setq T2 "B: X:12@175 Y:12@200"))) 
       ((= Num 26)  (Progn (setq T1 "DJ04" ) (setq T2 "")))
       ((= Num 27)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 28)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 29)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 30)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 31)  (Progn (setq T1 "DJ05" ) (setq T2 "")))
       ((= Num 32)  (Progn (setq T1 "DJ03" ) (setq T2 "")))
       ((= Num 33)  (Progn (setq T1 "DJ02" ) (setq T2 "")))       
)

(command "text" LP5  "300" "" T1)
(command "text" LP6  "300" "" T2)

)
)



(setvar "CMDECHO" 1)
(prompt "程序运行正确\n")
)

;;;;;;调试部分代码
;;;(command "dimlinear" DXP1 DXP2   "400" "")
;;;(setq DXP1 '(0 0))
;;;(setq DXP2 '(1000 0 ))

;;;(command "text" "0,0"  "300" "" "B: X&Y:12@150")
;;;(command "text" "0,0"  "300" "" "")



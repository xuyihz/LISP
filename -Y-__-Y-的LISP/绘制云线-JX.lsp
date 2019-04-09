;;;; @-Y-__-Y- 2015-11-10 星期二 天气阴雨 
;;;;加载自定义程序
;;;;101HYXYY YY为固定后缀，HZYX即绘云线  1代表校审  0 绘云线   1 第1类  结构图上有疑问的

(defun c:200HYXYY()                
(SETVAR "CMDECHO" 0) 
(HYXYY0)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)

(defun c:209HYXYY()                
(SETVAR "CMDECHO" 0) 
(HYXYY9)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)


(defun c:201HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "10") ;;;红色
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)

(defun c:202HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "254") ;;;卉色
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)
(defun c:203HYXYY() ;;;建筑上的疑问                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "150")     ;;;粉色
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)

(defun c:204HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "2")     ;;;黄色
(HYXYY Num LType)
(princ "程序运行正确\n")
)

(defun c:205HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "7")     ;;;白色
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)

(defun c:207HYXYY()                
(SETVAR "CMDECHO" 0) 
(setq Num 1)
(setq LType "7")     ;;;白色
(setq LType "240") ;;;红色
(HYXYY Num LType)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)

(defun HYXYY(Num1 LType1)
(setq chklay0  (getvar "clayer"))

(cond ((= LType1 "10") (setq Laname (strcat "-Y-__-Y-的结疑"  "图层")))  ;;结构上不确定的
      ((= LType1 "254") (setq Laname (strcat "-Y-__-Y-的修"  "图层")))  ;; 结构上修改的
      ((= LType1 "150") (setq Laname (strcat "-Y-__-Y-的建疑"  "图层")))   ;;  对于建筑上有疑问的
      ((= LType1 "2") (setq Laname (strcat "-Y-__-Y-的配筋修"  "图层")))  ;;  配筋有问题的
      ((= LType1 "7") (setq Laname (strcat "-Y-__-Y-的结注"  "图层")))  ;;  
      ((= LType1 "240") (setq Laname (strcat "-Y-__-Y-的结修"  "图层")))  ;;出图后有修正错误的
      (T ())
      )
      

(setq chklay (tblsearch "layer" Laname)) (if (= chklay nil) (command "layer" "m" Laname "c" LType1 "" "")(command "layer" "s" Laname "") )

(setq Textname "-Y-__-Y-的黑体")
(setq chktext (tblsearch "style" Textname)) (if (= chktext nil) (command "style" Textname "黑体" "" "1.0" "" "" "" )(command "textstyle" Textname) )


(command "color" "ByLayer")      

      
;;;;;; II-获取云线尺寸与位置 
(setq P1 (getpoint "选取云线第一角点！\n"))
(setq P2(getcorner P1 "选取云线第二角点！\n")) 
(command "rectangle" P1 P2) 



(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq DX (abs (- P1X P2X)) )
(setq DY (abs (- P1Y P2Y)) )
(setq Dmin (min DX DY))
(setq d (/ Dmin 5))
(command "revcloud" "S" "C" "A" d d "O" (entlast) "") 
(setq lst (entget (entlast)))
(setq old (cdr (assoc 43 lst)))  
(setq new (cons 43 10))
(setq lst (subst new (assoc 43 lst) lst))
(entmod lst)  

;;;III-绘制引出线
(setq dd (getvar "PLINEWID"))
(SETVAR "PLINEWID" 20)
(setq P3 (getpoint  "选取引出线第一角点！\n"))
(setq P4 (getpoint P3 "选取引出线第二角点！\n"))
(command "pline" P3 P4 "")
(setq P5 (getpoint P4 "选取引出线第一角点！\n"))
(command "pline" P4 P5 "")

(setq ss (getvar "osmode"))
(setvar "osmode" 0)


 ;;;IV-输入修订编号

(if (= Num1 0) (princ "不添加文字注释\n")
(progn
(setq P3X (car P3))
(setq P3Y (cadr P3))
(setq P4X (car P4))
(setq P4Y (cadr P4)) 
(setq P5X (car P5))
(setq P5Y (cadr P5))
(setq DX (- P5X P4X))
(setq DY (- P4Y P3Y))
(setq PT1 (list (+ P4X 50)  (+ P4Y 150)  ));;;第一行右端点
(setq PT2 (list (+ P4X 50)  (- P4Y 150)  ));;;第一行右端点
(cond ((= LType1 "10") (setq MyText (strcat "结疑"  "---" )))  ;;结构上不确定的
      ((= LType1 "254") (setq MyText (strcat "修" "---" )))  ;; 结构上修改的
      ((= LType1 "150") (setq MyText (strcat "建疑"  "---" )))   ;;  对于建筑上有疑问的
      ((= LType1 "2") (setq MyText (strcat "配筋修"  "---")))  ;;  配筋修正
      ((= LType1 "7") (setq MyText (strcat "结注"  "---")))  ;;  结构上对建筑的提醒
      ((= LType1 "240") (setq MyText (strcat "结修"  "---")))  ;;  结构上对建筑的提醒
      (T ())
      )
(setq CTime (menucmd "M=$(edtime, $(getvar, date), YYYY\"年\"M\"月\"D\"日\")") )
  
(if  (> DX 0)
(progn
(command "text" "J" "BL" PT1  "500" "0" MyText  )
(command "text" "J" "TL" PT2  "500" "0" CTime  )
)

(progn
(command "text" "J" "BR" PT1  "500" "0" MyText )
(command "text" "J" "TR" PT2  "500" "0" CTime  )
)
)
(entmod lst)
)
)

(setvar "osmode" ss)
(SETVAR "PLINEWID" dd)
(command "clayer" chklay0)
)

(defun HYXYY0()

(setq Laname (strcat "-Y-__-Y-的云线图层")) 
   
(setq chklay (tblsearch "layer" Laname)) (if (= chklay nil) (command "layer" "m" Laname "c" 30 "" "")(command "layer" "s" Laname "") )

(setq Textname "-Y-__-Y-的黑体")
(setq chktext (tblsearch "style" Textname)) (if (= chktext nil) (command "style" Textname "黑体" "" "1.0" "" "" "" )(command "textstyle" Textname) )


(command "color" "ByLayer")      
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
      
;;;;;; II-获取云线尺寸与位置 
(setq P1 (getpoint "选取云线第一角点！\n"))
(setq P2(getcorner P1 "选取云线第二角点！\n")) 
(command "rectangle" P1 P2) 
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq DX (abs (- P1X P2X)) )
(setq DY (abs (- P1Y P2Y)) )
(setq Dmin (min DX DY))
(setq d (/ Dmin 5))
(command "revcloud" "S" "C" "A" d d "O" (entlast) "") 
(setq lst (entget (entlast)))
(setq old (cdr (assoc 43 lst)))  
(setq new (cons 43 10))
(setq lst (subst new (assoc 43 lst) lst))
(entmod lst)  
(setvar "OSMODE" ss)

;;;III-绘制引出线
(setq dd (getvar "PLINEWID"))
(SETVAR "PLINEWID" 20)
(setq P3 (getpoint  "选取引出线第一角点！\n"))
(setq P4 (getpoint P3 "选取引出线第二角点！\n"))
(command "pline" P3 P4 "")
(setq P5 (getpoint P4 "选取引出线第一角点！\n"))
(command "pline" P4 P5 "")


 ;;;IV-输入修订编号
(setq P3X (car P3))
(setq P3Y (cadr P3))
(setq P4X (car P4))
(setq P4Y (cadr P4)) 
(setq P5X (car P5))
(setq P5Y (cadr P5))
(setq DX (- P5X P4X))
(setq DY (- P4Y P3Y))
(setq PT1 (list (+ P4X 50)  (+ P4Y 50)  ));;;第一行右端点
(setq MyText "注---")

 
  
(if  (> DX 0)

(command "text" "J" "BL" PT1  "500" "0" MyText)
 
(command "text" "J" "BR" PT1  "500" "0" MyText)
 
)

(SETVAR "PLINEWID" dd)


)


(defun HYXYY9()

(setq Laname (strcat "-Y-__-Y-的云线图层")) 
   
(setq chklay (tblsearch "layer" Laname)) (if (= chklay nil) (command "layer" "m" Laname "c" 30 "" "")(command "layer" "s" Laname "") )

(setq Textname "-Y-__-Y-的黑体")
(setq chktext (tblsearch "style" Textname)) (if (= chktext nil) (command "style" Textname "黑体" "" "1.0" "" "" "" )(command "textstyle" Textname) )


(command "color" "ByLayer")      

      
;;;;;; II-获取云线尺寸与位置 
(setq dd (getvar "PLINEWID"))
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(setq P1 (getpoint "选取云线第一角点！\n"))
(setq P2(getcorner P1 "选取云线第二角点！\n")) 



(command "rectangle" P1 P2) 
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq DX (abs (- P1X P2X)) )
(setq DY (abs (- P1Y P2Y)) )
(setq Dmin (min DX DY))
(setq d (/ Dmin 5))
(command "revcloud" "S" "C" "A" d d "O" (entlast) "") 
(setq lst (entget (entlast)))
(setq old (cdr (assoc 43 lst)))  
(setq new (cons 43 10))
(setq lst (subst new (assoc 43 lst) lst))
(entmod lst)  

(setvar "OSMODE" ss)
(setvar "PLINEWID" dd)
)











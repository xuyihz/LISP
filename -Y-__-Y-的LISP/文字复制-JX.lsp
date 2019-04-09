;;;; 姜雄 2015-12-15 星期二 天气阴 
;;;;文字复制
;;;;用于在原有文字基础上下拉一个文字 
(defun C:42( )
(WZFZYY "X") ;;;水平
)
(defun C:43( )
(WZFZYY "Y")	;;;垂直
)
 
(defun WZFZYY( direct / #k %k i gr n pt  first lst)
(SETVAR "CMDECHO" 0)
(setvar "osmode" 0)
(setq #k "1";文字内容
       %k T  ;循环条件
       i nil ;初始设置
)
 

;;; 选择中相关文字
(setq sel0 (ssget ":S" '((0 . "TEXT"))))
(setq first  (ssname sel0 0))
(setq lst (entget first))

(setq style1 (cdr (assoc 7 lst))) ;;; 得到文字样式
(setq layer1 (cdr (assoc 8 lst))) ;;; 得到文字图层
(setq context1 (cdr (assoc 1 lst))) ;;; 得到文字内容
(setq angle1 (cdr (assoc 50 lst))) ;;; 得到旋转角度
(setq duiqi1 (cdr (assoc 72 lst))) ;;; 得到对齐方式
(setq duiqi2 (cdr (assoc 73 lst))) ;;; 得到对齐方式
(setq height1 (cdr (assoc 40 lst))) ;;; 得到文字高度
(setq ratio1 (cdr (assoc 41 lst))) ;;; 得到文字比例
(setq Colname (cdr (assoc 62 lst)))
(if  (and (= duiqi1 0 )(= duiqi2 0 )) (setq ptype 10) (setq ptype 11))
(setq ptype2 11)

(if  (or (= duiqi1 3 )(= duiqi1 5 )) 
(progn
(setq  lst (subst '(72 . 0) (assoc 72 lst) lst)) 

(setq  lst (subst '(11  0 0 0) (assoc 11 lst) lst))

(entmod lst) 
(setq ptype 10)
)
	
)





(setq old1 (cdr (assoc 10 lst))) ;;; 得到坐标
(setq old2 (cdr (assoc 11 lst))) ;;; 得到坐标
(setq old1x (car old1)) ;;; 得到X坐标
(setq old1y (cadr old1)) ;;; 得到y坐标
(setq old1z (caddr old1)) ;;; 得到z坐标
(setq old2x (car old2)) ;;; 得到X坐标
(setq old2y (cadr old2)) ;;; 得到y坐标
(setq old2z (caddr old2)) ;;; 得到z坐标

(setq Px (cadr (assoc ptype lst))) ;;; 得到X坐标
(setq Py (caddr (assoc ptype lst))) ;;; 得到y坐标


(command "clayer" layer1)
(command "textstyle" style1)
(cond ( (and (= duiqi1 0 )(= duiqi2 1 )) (setq duiqiStyle "BL") )
	( (and (= duiqi1 0 )(= duiqi2 2 )) (setq duiqiStyle "ML") )
	( (and (= duiqi1 0 )(= duiqi2 3 )) (setq duiqiStyle "TL") )
	( (and (= duiqi1 1 )(= duiqi2 1 )) (setq duiqiStyle "BC") )
	( (and (= duiqi1 1 )(= duiqi2 2 )) (setq duiqiStyle "MC") )
	( (and (= duiqi1 1 )(= duiqi2 3 )) (setq duiqiStyle "TC") )
	( (and (= duiqi1 2 )(= duiqi2 1 )) (setq duiqiStyle "BR") )
	( (and (= duiqi1 2 )(= duiqi2 2 )) (setq duiqiStyle "MR") )
	( (and (= duiqi1 2 )(= duiqi2 3 )) (setq duiqiStyle "TR") )
	( (and (= duiqi1 0 )(= duiqi2 0 )) (setq duiqiStyle "L") )
	( (and (= duiqi1 1 )(= duiqi2 0 )) (setq duiqiStyle "C") )
	( (and (= duiqi1 2 )(= duiqi2 0 )) (setq duiqiStyle "R") )
	( (and (= duiqi1 3 )(= duiqi2 0 )) (setq duiqiStyle "A") )
	( (and (= duiqi1 4 )(= duiqi2 0 )) (setq duiqiStyle "M") )
	( (and (= duiqi1 5 )(= duiqi2 0 )) (setq duiqiStyle "F") )
)


(setq aa(/  (* angle1 180) pi))

;;;(command "text" "J" duiqiStyle old1  height1 aa context1)
(if (/= Colname Nil)

(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") (cons 8 layer1) '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 height1) (cons 1  context1) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 old2x old2y old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)(cons 62 Colname)))


(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") (cons 8 layer1) '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 height1) (cons 1  context1) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 old2x old2y old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)))
)



(setq tag 0)  


(while %k  
(setq  gr (grread t 4 0);;取得鼠标操作及坐标
n (car gr)       ;;鼠标操作
pt (cadr gr)     ;;鼠标坐标
)


(if (= n 5)

(if (= tag 0) ;;;******
(progn   ;;
(setq pt0 pt
tag 1
)

)
(progn
(setq deltax (- (car pt) (car pt0))) 
(setq deltay (- (cadr pt) (cadr pt0)))

(cond ((= "Y" direct) (progn (setq cos1 (- 0 (sin angle1)) ) (setq cos2 (cos angle1) ) ) )
     ((= "X" direct)(progn (setq cos1 (cos angle1) ) (setq cos2 (sin angle1) ) ))
)



(setq l1 (* deltax cos1))
(setq l2 (* deltay cos2))
(setq l (+ l1 l2)) 
(setq deltax2 (* l cos1)) ;;; 得到起点偏移x坐标
(setq deltay2 (* l cos2)) ;;; 得到起点偏移y坐标
(setq first  (ssname sel0 0))  
(setq lst (entget first)) 

(setq newP1 (list (+ Px deltax2) (+ Py deltay2)))



(setq new1 (cons ptype newP1))
(setq lst (subst new1 (assoc ptype lst) lst))

(entmod lst) 


) 
) 
)  


(if (= n 3) (setq %k nil) );;3表示左键;结束循环

(if (or (= n 2) (= n 25));;2表示空格;25表示右键;结束循环并删除文字
(setq %k nil)
)


)




(setvar "osmode" 4271)
(SETVAR "CMDECHO" 1)
)

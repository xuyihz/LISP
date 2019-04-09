;;;; 姜雄 2016-02-24 星期三 天气晴 
;;;;文字移动
;;;; 2031WZYDYY YY为固定后缀

(defun C:40( )
(WZYDYY "X")	
)
(defun C:41( )
(WZYDYY "Y")	
)
 
(defun WZYDYY (direct)
(SETVAR "CMDECHO" 0)
(setq os1 (getvar "osmode"))
(setvar "osmode" 0)
(setq #k "1";文字内容
       %k T  ;循环条件
       i nil ;初始设置
)
 

;;; 选择中相关集中标注 
(setq sel0 (ssget ":S" '((0 . "TEXT"))))
(setq first  (ssname sel0 0))
(setq lst (entget first))

(setq style1 (cdr (assoc 7 lst))) ;;; 得到文字内容
(setq layer1 (cdr (assoc 8 lst))) ;;; 得到文字图层
(setq context1 (cdr (assoc 1 lst))) ;;; 得到文字内容
(setq angle1 (cdr (assoc 50 lst))) ;;; 得到旋转角度
(setq duiqi1 (cdr (assoc 72 lst))) ;;; 得到对齐方式
(setq duiqi2 (cdr (assoc 73 lst))) ;;; 得到对齐方式


(if  (and (= duiqi1 0 )(= duiqi2 0 )) (setq ptype 10) (setq ptype 11))
(if  (or (= duiqi1 3 )(= duiqi1 5 )) 
(progn
(setq  lst (subst '(72 . 0) (assoc 72 lst) lst)) 

(setq  lst (subst '(11  0 0 0) (assoc 11 lst) lst))

(entmod lst) 
(setq ptype 10)
)
)


(setq Px (cadr (assoc ptype lst))) ;;; 得到X坐标
(setq Py (caddr (assoc ptype lst))) ;;; 得到y坐标



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


(prompt "h390")


(setvar "osmode" os1)
(SETVAR "CMDECHO" 1)
)

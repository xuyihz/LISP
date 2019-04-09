;;;; 姜雄 2015-12-15 星期二 天气阴 
;;;;文字复制
;;;;用于在原有文字基础上下拉一个文字 
(defun C:0(/ #k %k i gr n pt  first lst )

(SETVAR "CMDECHO" 0)
(setvar "osmode" 0)

;;; 选择中相关文字
(setq sel (ssget  '((0 . "TEXT"))))
(if (/= sel Nil)
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii))
(setq lst (entget first))

(setq style1 (cdr (assoc 7 lst))) ;;; 得到文字样式
(setq layer1 (cdr (assoc 8 lst))) ;;; 得到文字图层
(setq context0 (cdr (assoc 1 lst))) ;;; 得到文字内容
(setq angle1 (cdr (assoc 50 lst))) ;;; 得到旋转角度
(setq duiqi1 (cdr (assoc 72 lst))) ;;; 得到对齐方式
(setq duiqi2 (cdr (assoc 73 lst))) ;;; 得到对齐方式
(setq height1 (cdr (assoc 40 lst))) ;;; 得到文字高度
(setq ratio1 (cdr (assoc 41 lst))) ;;; 得到文字比例
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


(setq NumCol (vl-string-search  ";" context0))
(setq NumRig (vl-string-search ")" context0));;;找到右括号
(setq NumLef (vl-string-search "(" context0));;;找到左括号
(if (/= NumLef Nil)	
	(progn
	(setq NewContext1 (substr context0 1 NumLef) )
	(setq NewContext2 (substr context0 (+ NumRig 2 )) )
	(setq context0 (strcat NewContext1 NewContext2))
)
)	
(if (/= NumCol Nil)
	(progn
	(setq context01 (substr context0 1 NumCol ))
	(setq sum1 (JSMJ context01))
	(setq context02 (substr context0  (+ NumCol 2) ))
	(setq sum2 (JSMJ context02))
	(setq sum (strcat (rtos sum1 2 1) ";" (rtos sum2 2 1) ))
	;;;计算得到配筋面积	
	)
	(progn
	(setq context01 (substr context0 1 ))
	(setq sum1 (JSMJ context01))
	(setq sum (rtos sum1 2 1))
	;;;计算得到配筋面积
    )
);;;得到板顶和板底配筋





(if (= sum1 0) ()
(if (=  angle1 0)
(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(62 . 1)'(410 . "Model") (cons 8 "-Y-__-Y-的配筋修图层") '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 150) (cons 1  sum) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 old2x  (- old2y 200) old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)))
(entmake (list '(0 . "TEXT") '(100 . "AcDbEntity") '(67 . 0) '(62 . 1)'(410 . "Model") (cons 8 "-Y-__-Y-的配筋修图层") '(100 . "AcDbText") (list 10 old1x old1y old1z) (cons 40 150) (cons 1  sum) (cons 50 angle1) (cons 41  ratio1) '(51 . 0.0) (cons 7 style1) '(71 . 0) (cons 72  duiqi1) (list 11 (+ old2x 200)  old2y  old2z) '(210 0.0 0.0 1.0) '(100 . "AcDbText") (cons 73 duiqi2)))
)

)
(entmod lst)
(setq ii (+ ii 1))
)
)
)
(setvar "osmode" 4271)
(SETVAR "CMDECHO" 1)
)


(defun JSMJ(context00)
(setq NumPlus (vl-string-search  "+" context00))
(setq NumSlas (vl-string-search  "/" context00))
(setq NumNull (vl-string-search  " " context00))
(if (/= NumNull Nil)  
    (setq context00 (substr context00 1 NumNull ) )
)
(cond
	((/= NumPlus Nil)
    (progn
	(setq context1 (substr context00 1 NumPlus ) )
	(setq context2 (substr context00  (+ NumPlus 2) ))
    ))

    ((/= NumSlas Nil)
    (progn 
	(setq context1 (substr context00 1 NumSlas ) )
	(setq context2 (substr context00  (+ NumSlas 2) ))
    ))
    (T (progn  
	(setq context1 (substr context00 1 ))
	(setq context2 "0")
     ))
)

(setq sum 0)
(setq jj 0)
(while (< jj 2)
  (cond 
	  ( (= jj 0) (setq context3 context1) )
	  ( (= jj 1) (setq context3 context2) )
  )
  
 (cond

((= context3 "0") (setq num 0))
((= context3 "2%%13212") (setq num 226))
((= context3 "4%%13212") (setq num 339))
((= context3 "6%%13212") (setq num 679))
((= context3 "8%%13212") (setq num 905))
((= context3 "10%%13212") (setq num 1131))
((= context3 "12%%13212") (setq num 1357))	
((= context3 "14%%13212") (setq num 1583))	
((= context3 "16%%13212") (setq num 1810))
((= context3 "18%%13212") (setq num 2036))	

((= context3 "1%%13214") (setq num 154))
((= context3 "2%%13214") (setq num 308))
((= context3 "3%%13214") (setq num 462))
((= context3 "4%%13214") (setq num 615))
((= context3 "5%%13214") (setq num 770))	
((= context3 "6%%13214") (setq num 924))
((= context3 "7%%13214") (setq num 1077))
((= context3 "8%%13214") (setq num 1232))
((= context3 "10%%13214") (setq num 1539))
((= context3 "12%%13214") (setq num 1847))	
((= context3 "14%%13214") (setq num 2155))	
((= context3 "16%%13214") (setq num 2462))
((= context3 "18%%13214") (setq num 2770))
((= context3 "20%%13214") (setq num 3078))
((= context3 "22%%13214") (setq num 3386))

((= context3 "1%%13216") (setq num 201)) 	
((= context3 "2%%13216") (setq num 402)) 
((= context3 "3%%13216") (setq num 603)) 
((= context3 "4%%13216") (setq num 804))
((= context3 "5%%13216") (setq num 1005))
((= context3 "6%%13216") (setq num 1206))
((= context3 "7%%13216") (setq num 1407))
((= context3 "8%%13216") (setq num 1608))
((= context3 "10%%13216") (setq num 2011))
((= context3 "12%%13216") (setq num 2413))
((= context3 "14%%13216") (setq num 2815))
((= context3 "16%%13216") (setq num 3218))
((= context3 "18%%13216") (setq num 3620))

((= context3 "1%%13218") (setq num 254))
((= context3 "2%%13218") (setq num 509))
((= context3 "3%%13218") (setq num 763))
((= context3 "4%%13218") (setq num 1017))
((= context3 "5%%13218") (setq num 1272))
((= context3 "6%%13218") (setq num 1527))
((= context3 "7%%13218") (setq num 1781))
((= context3 "8%%13218") (setq num 2036))
((= context3 "10%%13218") (setq num 2545))
((= context3 "12%%13218") (setq num 3054))
((= context3 "14%%13218") (setq num 3563))
((= context3 "16%%13218") (setq num 4072))

((= context3 "1%%13220") (setq num 314))
((= context3 "2%%13220") (setq num 628))
((= context3 "3%%13220") (setq num 942))
((= context3 "4%%13220") (setq num 1257))
((= context3 "5%%13220") (setq num 1570))
((= context3 "6%%13220") (setq num 1885))
((= context3 "7%%13220") (setq num 2199))
((= context3 "8%%13220") (setq num 2513))
((= context3 "10%%13220") (setq num 3142))
((= context3 "12%%13220") (setq num 3770))
((= context3 "14%%13220") (setq num 4399))
((= context3 "16%%13220") (setq num 5027))

((= context3 "1%%13222") (setq num 380))
((= context3 "2%%13222") (setq num 760))
((= context3 "3%%13222") (setq num 1140))
((= context3 "4%%13222") (setq num 1521))
((= context3 "5%%13222") (setq num 1901))
((= context3 "6%%13222") (setq num 2281))
((= context3 "7%%13222") (setq num 2661))
((= context3 "8%%13222") (setq num 3041))
((= context3 "10%%13222") (setq num 3801))
((= context3 "12%%13222") (setq num 4561))
((= context3 "14%%13222") (setq num 5321))
((= context3 "16%%13222") (setq num 6082))

((= context3 "1%%13225") (setq num 491))
((= context3 "2%%13225") (setq num 982))
((= context3 "3%%13225") (setq num 1473))
((= context3 "4%%13225") (setq num 1963))
((= context3 "5%%13225") (setq num 2454))
((= context3 "6%%13225") (setq num 2945))
((= context3 "8%%13225")  (setq num 3927))
((= context3 "10%%13225") (setq num 4909))
((= context3 "12%%13225") (setq num 5891))
((= context3 "14%%13225") (setq num 6873))
((= context3 "16%%13225") (setq num 7854))

(T (setq num 0))
)
(setq sum (+ sum num))
(setq jj (+ jj 1))	
)
(setq sum (*(/ sum 10) 10 ))
(setq sum (float sum))
(setq sum  (/ sum 100))

sum
)

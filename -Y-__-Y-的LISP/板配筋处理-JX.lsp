;;;; 姜雄 2016-1-11 星期一 天气阴雨
;;;;板配筋减去某数字，同时非值隐藏

(defun c:232( / )
(SETVAR "CMDECHO" 0)
(command "layer" "m" "-Y-__-Y-的板配筋隐藏图层" "c" "9" "" "") 
(command "clayer" "0")  
(command "layer" "off" "-Y-__-Y-的板配筋隐藏图层" "") 
 
(initget (+ 1 2 4)) 
(setq Num (getint "\n减去数值(251 279 335/393 436 523)：")) 
 
      
(setq sel (ssget '((-4 . "<or")(8 . "12")(8 . "13") (-4 . "or>")) ) ) 


(if (/= sel Nil) 
(progn
(setq aa (sslength sel))
(setq ii 0)
(while (< ii aa)
  (setq first  (ssname sel ii))
  (setq lst (entget first)) 
  (setq txt (atoi (cdr (assoc 1 lst))))
  (setq txt2 (- txt Num))
   (setq newtxt (itoa txt))
 (setq new (cons 1 newtxt))
 (setq lst (subst new (assoc 1 lst) lst))
  (if (<= txt2 0) 
  (progn
  (setq new2 (cons 8 "-Y-__-Y-的板配筋隐藏图层"))
  (setq lst (subst new2 (assoc 8 lst) lst))  
 )
)
(entmod lst)
(setq ii (+ ii 1))
)
)
)

(setvar "CMDECHO" 1)
(prompt "程序运行正确")
)


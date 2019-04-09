;;;; @-Y-__-Y- 2015-11-10 星期二 天气阴雨 
;;;;梁图层转换
;;;; YYLTCZH YY为固定前缀，LTCZH即梁图层转换
;;;;操作：需要做的就是点选出矩形选择框
;;;;需要注意的是需事先有"TSSD_REIN"文字格式


(defun C:305()
(SETVAR "CMDECHO" 0)
(setq P1 (getpoint "选取左上角点！\n"))
(setq P2 (getcorner P1 "选取右下角点！\n"))


(princ "选择需要转换图层实体\n")
(setq sel  (ssget "C" P1 P2))  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii)) 
(setq lst (entget first))
(setq laname (cdr (assoc 8 lst))) 
(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))


 (cond ((= laname "dsptext_beam") 
  
    (progn  
      (setq old (cdr (assoc 50 lst)))  
      (if  (or  (and (>= old t1) (<= old t2))  (and (>= old t3) (<= old t4))  )    (setq new (cons 8 "配筋面积_Y"))    (setq new (cons 8 "配筋面积_X"))  )
      (setq lst (subst new (assoc 8 lst) lst))  
      (entmod lst)  
    ))
    ((= laname "dsptext_col")
        (progn  
      (setq new (cons 8 "柱配筋面积")) 
      (setq lst (subst new (assoc 8 lst) lst))  
      (command "change" first "" "p" "c" 2  "" )
      (entmod lst)  
    ))
)
 

(setq ii (+ ii 1))

)
)
) 

(setvar "CMDECHO" 1)
(princ "程序运行正确\n")


) 


;;;;;以下为调试部分 
;;;(setq sel (ssget ))    
;;;(setq first  (ssname sel 0))  
;;;(setq lst (entget first))



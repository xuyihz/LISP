;;;; @-Y-__-Y- 2016-06-29 星期三 天气阴雨 
;;;;梁图层转换

(defun C:308()
(SETVAR "CMDECHO" 0)



(princ "选择需要转换的平法标注\n")
(setq sel (ssget '((-4 . "<or")(8 . "S-BEAM-X")(8 . "S-BEAM-Y") (-4 . "or>")) ) )  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first1  (ssname sel ii)) 
(setq lst (entget first1))
(setq laname (cdr (assoc 8 lst))) 
(setq Colname (cdr (assoc 62 lst))) 
(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))



(cond 
((or (= laname "S-BEAM-X") (= laname "S-BEAM-Y"))    
    (progn   
      (command "change" first1 "" "p" "c" 7  "" ) 
      
    )
)

)
 
(setq ii (+ ii 1))

)
)
) 

(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
) 


(defun C:309()
(SETVAR "CMDECHO" 0)



(princ "选择需要转换的平法标注\n")
(setq sel (ssget '((-4 . "<or")(8 . "S-BEAM-X")(8 . "S-BEAM-Y") (-4 . "or>")) ) )  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first1  (ssname sel ii)) 
(setq lst (entget first1))
(setq laname (cdr (assoc 8 lst))) 
(setq Colname (cdr (assoc 62 lst))) 
(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))



(cond 
((or (= laname "S-BEAM-X") (= laname "S-BEAM-Y"))    
    (progn   
      (command "change" first1 "" "p" "c" 211  "" ) 
      
    )
)

)
 
(setq ii (+ ii 1))

)
)
) 

(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
) 

(defun C:310()
(SETVAR "CMDECHO" 0)



(princ "选择需要转换的平法标注\n")
(setq sel (ssget '((-4 . "<or")(8 . "S-BEAM-X")(8 . "S-BEAM-Y") (-4 . "or>")) ) )  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first1  (ssname sel ii)) 
(setq lst (entget first1))
(setq laname (cdr (assoc 8 lst))) 
(setq Colname (cdr (assoc 62 lst))) 
(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))



(cond 
((or (= laname "S-BEAM-X") (= laname "S-BEAM-Y"))    
    (progn   
      (command "change" first1 "" "p" "c" 2  "" ) 
      
    )
)

)
 
(setq ii (+ ii 1))

)
)
) 

(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
) 

(defun C:311()
(SETVAR "CMDECHO" 0)



(princ "选择需要转换的平法标注\n")
(setq sel (ssget '((-4 . "<or")(8 . "S-BEAM-X")(8 . "S-BEAM-Y") (-4 . "or>")) ) )  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first1  (ssname sel ii)) 
(setq lst (entget first1))
(setq laname (cdr (assoc 8 lst))) 
(setq Colname (cdr (assoc 62 lst))) 
(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))



(cond 
((= laname "S-BEAM-X")
    (progn   
      (command "change" first1 "" "p" "c" 111  "" ) 
      
    )
)
((= laname "S-BEAM-Y")
    (progn   
      (command "change" first1 "" "p" "c" 133  "" ) 
       
    )
)

)
 

(setq ii (+ ii 1))

)
)
) 

(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
) 


(defun C:355()
(SETVAR "CMDECHO" 0)



(princ "选择需要转换的墙柱标注\n")
(setq sel (ssget '((8 . "S-COLU-TEXT")) ) )  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first1  (ssname sel ii)) 
(setq lst (entget first1))
(setq laname (cdr (assoc 8 lst))) 
(setq Colname (cdr (assoc 62 lst))) 



(cond 
("S-COLU-TEXT"    
    (progn   
      (command "change" first1 "" "p" "c" 30  "" ) 
      
    )
)

)
 
(setq ii (+ ii 1))

)
)
)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
) 


(defun C:366()
(SETVAR "CMDECHO" 0)



(princ "选择需要转换的墙柱标注\n")
(setq sel (ssget '((8 . "S-COLU-TEXT")) ) )  
(if (/= sel Nil) 
(progn
(setq aa (sslength  sel))
(setq ii 0)
(while (< ii aa)
(setq first1  (ssname sel ii)) 
(setq lst (entget first1))
(setq laname (cdr (assoc 8 lst))) 
(setq Colname (cdr (assoc 62 lst))) 




(cond 
("S-COLU-TEXT"    
    (progn   
      (command "change" first1 "" "p" "c" 7  "" ) 
      
    )
)

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



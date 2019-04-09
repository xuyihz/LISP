;;;; @-Y-__-Y- 2015-12-24 星期四 天气雾霾 
;;;;加载自定义程序
;;;;YY 为固定后缀，BCZX即补充轴线

(defun c:75(/ eps sel aa first lst P1X P1Y P2X P2Y PE1 PE2 Psame NewP1 NewP2)
(SETVAR "CMDECHO" 0) 
(setq chklay  (getvar "clayer"))
(command "clayer"  "C-DOTE")
(setq ss (getvar "OSMODE"))
(setvar "OSMODE" 0)
(setq eps 0.01)
 
I-选中需要绘制轴线的梁
(prompt "选择轴线1\n")
(setq sel (ssget  ":S" '((8 . "C-DOTE")) ))
(if (/= sel Nil)
(setq aa (sslength  sel))
)
(while (or (/= aa 1) (= sel Nil))
 
(if (/= sel Nil) 
(progn
(prompt "轴线选择过多，请重新选择\n")
)
(prompt "未选中轴线，请重新选择\n")
)
(setq sel (ssget   '((8 . "C-DOTE")) )) 
(setq aa (sslength  sel))
)


(setq first  (ssname sel 0)) 
(setq lst (entget first))
(setq P1X (cadr (assoc 10 lst)))
(setq P1Y (caddr (assoc 10 lst)))
(setq P2X (cadr (assoc 11 lst)))
(setq P2Y (caddr (assoc 11 lst)))
(cond ((< (abs (- P1X P2X))  eps) (setq PE1 P1X))
      ((< (abs (- P1Y P2Y))  eps) (setq PE1 P1Y))
)






(prompt "选择轴线2\n") 
(setq sel (ssget ":S"  '((8 . "C-DOTE")) ))
(if (/= sel Nil)
(setq aa (sslength  sel))
)
(while (or (/= aa 1) (= sel Nil))
(if (/= sel Nil) 
(progn
(prompt "轴线选择过多，请重新选择\n")
)
(prompt "未选中轴线，请重新选择\n")
)
(setq sel (ssget   '((8 . "C-DOTE")) )) 
(setq aa (sslength  sel))
)


(setq first  (ssname sel 0)) 
(setq lst (entget first))
(setq P1X (cadr (assoc 10 lst)))
(setq P1Y (caddr (assoc 10 lst)))
(setq P2X (cadr (assoc 11 lst)))
(setq P2Y (caddr (assoc 11 lst)))
(cond ((< (abs (- P1X P2X))  eps) (setq PE2 P1X))
      ((< (abs (- P1Y P2Y))  eps) (setq PE2 P1Y))
)


(prompt "选择梁线\n") 
(setq sel (ssget   '((-4 . "<or")(8 . "S-BEAM-LINE1")(8 . "S-BEAM-LINE2") (-4 . "or>")) ))    
(if (/= sel Nil) 
(setq aa (sslength  sel))
)
(while (or (/= aa 2) (= sel Nil))
(if (/= sel Nil) 
(progn
(prompt "梁线选择过多/不足，请重新选择\n")
)
(prompt "未选中梁线，请重新选择\n")
)
(setq sel (ssget   '((-4 . "<or")(8 . "S-BEAM-LINE1")(8 . "S-BEAM-LINE2") (-4 . "or>")) )) 
(setq aa (sslength  sel))
)

(setq Psame 0)
(setq ii 0)
(while (< ii aa)
(setq first  (ssname sel ii)) 
(setq lst (entget first))
(setq P1X (cadr (assoc 10 lst)))
(setq P1Y (caddr (assoc 10 lst)))
(setq P2X (cadr (assoc 11 lst)))
(setq P2Y (caddr (assoc 11 lst)))

(cond ( (< (abs (- P1X P2X))  eps) (setq Psame (+ Psame (/ P1X 2) ))) ((< (abs (- P1Y P2Y))  eps) (setq Psame (+ Psame (/ P1Y 2) ))))
(setq ii (+ ii 1))
)


I-绘制梁线
(cond ((< (abs (- P1X P2X))  eps) (progn (setq NewP1 (list Psame PE1 ))  (setq NewP2 (list Psame PE2)))) 
((< (abs (- P1Y P2Y))  eps) (progn (setq NewP1 (list PE1 Psame  ))  (setq NewP2 (list PE2 Psame )))) 
)

(command "line" NewP1 NewP2 "")
(command "clayer" chklay)
(setvar "OSMODE" ss)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")
)

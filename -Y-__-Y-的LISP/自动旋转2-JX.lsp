;;;; @-Y-__-Y- 2016-09-14 星期三 天气阴雨 



(defun C:996()
(SETVAR "CMDECHO" 0)

(setq ss (getvar "osmode"))
(setvar "osmode" 1)
(setq P1 (getpoint "选取第一角点！\n"))
(setq P2(getcorner P1 "选取第二角点！\n")) 
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))


  
(setvar "osmode" 0)
(setq PCX (/ (+ P1X P2X) 2))
(setq PCY (/ (+ P1Y P2Y) 2))
(setq PC (list PCX PCY ))



(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "on" "*" "") ;;;全部打开

(setq sel  (ssget "W" P1 P2))  
(if (/= sel Nil)
	(command "rotate" sel "" PC 90)
)




(setvar "osmode" ss)
(setvar "CMDECHO" 1)
(princ "程序运行正确\n")


) 


;;;;;以下为调试部分 
;;;(setq sel (ssget ))    
;;;(setq first  (ssname sel 0))  
;;;(setq lst (entget first))



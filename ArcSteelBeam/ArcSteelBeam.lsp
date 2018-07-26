;;;; @-Y-__-Y- 2016-5-10 星期二 天气阴雨 
;;;;加载自定义程序

(defun C:cc() ;绘制引出线 

;;;(command "textstyle" "TSSD_REIN")

(command "clayer" "Gjlx")
(setvar "plinewid" 100)
(setq P3 (getpoint  "选取圆心！\n"))
(setq P4 (getpoint P3 "选取引出线第一角点！\n"))
(setq P5 (getpoint P3 "选取引出线第二角点！\n"))

(setq ss (getvar "osmode"))
(setvar "osmode" 0)

(setq t4 (angle  P3  P4))
(setq t5 (angle  P3  P5))
(setq r (distance p3 p4) )
(setq dt (/ 400 r) )
(setq t42 (+ t4 dt ))
(setq t52 (- t5 dt ))

(setq  P42 (polar P3 t42 r))
(setq  P52 (polar P3 t52 r) )
(command "PLINE"  P42 "A" "CE" P3 P52 "")

(command "clayer" "STPM_RBEAM_SIG")

(setq dt2 (/ 250 r) )
(setq t43 (+ t42 dt2 ))
(setq t53 (- t52 dt2 ))
(setq  P43 (polar P3 t43 r))
(setq  P53 (polar P3 t53 r) )

(command "PLINE"  P52 "W" 250 0 P53 "")
(command "PLINE"  P42 "W" 250 0 P43 "")
(command "clayer" "0")

;;;(command "line" P42 P52 "")
;;;(command "line" P4 P5 "")
(setvar "osmode" ss)
)

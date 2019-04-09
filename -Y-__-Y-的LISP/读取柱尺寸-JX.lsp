;;;; 姜雄 2015-12-14 星期一· 天气阴
;;;; DQZCCYY YY为固定后缀，DQZCC即读取配筋
;;;; 读取柱尺寸并显示在CAD命令栏中
(defun c:986() 
(setvar "CMDECHO" 0) ;;使不显示命令提示


(setq sel (ssget ":S"  '((-4 . "<or")(8 . "S-COLU-LINE1")(8 . "S-COLU-LINE2") (-4 . "or>")) ))
(setq first  (ssname sel 0))
(setq lst (entget first))
(setq lst (member (assoc 10 lst) lst))
(setq ii 1)                                       

(repeat 3
  (progn
  (if (= ii 1)
  (setq P1 (cdar lst))
  )
  (if (= ii 2)
  (setq P2 (cdar lst))
  )
  (if (= ii 3)
  (setq P3 (cdar lst))
  )
  (if (= ii 4)
  (setq P4 (cdar lst))
  )
  (setq lst (cdr lst))
  (setq lst (member (assoc 10 lst) lst))
  (setq ii (+ ii 1))
  ) 
) 

(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))
(setq P3X (car P3))
(setq P3Y (cadr P3))

(setq DX (rtos (setq DX (abs (- P1X P2X))) 2 0))
(setq DY (rtos (setq DY (abs (- P1Y P2Y))) 2 0))

(setq DX12  (abs (- P1X P2X)))
(setq DY12  (abs (- P1Y P2Y))) 
(setq DW (sqrt(+(* DX12 DX12) (* DY12 DY12)) ))
(setq DW (rtos DW 2 0))

(setq DX23  (abs (- P2X P3X)))
(setq DY23 (abs (- P2Y P3Y))) 
(setq DL (sqrt(+(* DX23 DX23) (* DY23 DY23)) ))
(setq DL (rtos DL 2 0)) 

(prompt (strcat "柱尺寸为: " DW "x" DL "\n" )) 
(setvar "CMDECHO" 1)
)

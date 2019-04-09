
;;;; 姜雄 2016-06-12 星期一 天气雨
(defun C:96() 	(setvar "OSMODE" 4271) ) ;;开启捕捉
(defun C:97() 	(setvar "OSMODE" 0) ) ;;关闭捕捉



(defun C:78() 	(initget (+ 1  4))(setq Num (getint "\n设置线宽：") ) (setvar "plinewid" Num)) ;;设置多段线线宽
(defun C:98() 	(initget (+ 1  4))(setq Num (getint "\n设置线宽：") ) (command "mline" "S" Num "")) ;;设置多线线宽




(defun C:95() 	(command "zoom" "A")) ;;视图缩放

(defun C:64() 	(command "dimlinear")) ;;直线标注
(defun C:65() 	(command "dimaligned")) ;;对齐标注
(defun C:66() 	(command "dimcontinue")) ;;连续标注
(defun C:60() 	(command "dimstyle" "R" "100")) ;;
(defun C:61() 	(command "dimstyle" "R" "50")) ;;
(defun C:62() 	(command "dimstyle" "R" "25")) ;;
(defun C:63() 	(command "dimstyle" "R" "20")) ;;
(defun C:67() 	(command "dimstyle" "R" "50-100")) ;;
(defun C:68() 	(command "dimstyle" "R" "25-100")) ;;
(defun C:69() 	(command "dimstyle" "R" "25-50")) ;;
(defun C:80() 	(command "dimangular")) ;;角度标注
(defun C:81() 	(command "dimtedit")) ;;移动标注文字位置




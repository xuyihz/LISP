
;;;; ���� 2016-06-12 ����һ ������
(defun C:96() 	(setvar "OSMODE" 4271) ) ;;������׽
(defun C:97() 	(setvar "OSMODE" 0) ) ;;�رղ�׽



(defun C:78() 	(initget (+ 1  4))(setq Num (getint "\n�����߿�") ) (setvar "plinewid" Num)) ;;���ö�����߿�
(defun C:98() 	(initget (+ 1  4))(setq Num (getint "\n�����߿�") ) (command "mline" "S" Num "")) ;;���ö����߿�




(defun C:95() 	(command "zoom" "A")) ;;��ͼ����

(defun C:64() 	(command "dimlinear")) ;;ֱ�߱�ע
(defun C:65() 	(command "dimaligned")) ;;�����ע
(defun C:66() 	(command "dimcontinue")) ;;������ע
(defun C:60() 	(command "dimstyle" "R" "100")) ;;
(defun C:61() 	(command "dimstyle" "R" "50")) ;;
(defun C:62() 	(command "dimstyle" "R" "25")) ;;
(defun C:63() 	(command "dimstyle" "R" "20")) ;;
(defun C:67() 	(command "dimstyle" "R" "50-100")) ;;
(defun C:68() 	(command "dimstyle" "R" "25-100")) ;;
(defun C:69() 	(command "dimstyle" "R" "25-50")) ;;
(defun C:80() 	(command "dimangular")) ;;�Ƕȱ�ע
(defun C:81() 	(command "dimtedit")) ;;�ƶ���ע����λ��




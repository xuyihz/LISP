;;;; @-Y-__-Y- 2016-09-14 ������ �������� 



(defun C:996()
(SETVAR "CMDECHO" 0)

(setq ss (getvar "osmode"))
(setvar "osmode" 1)
(setq P1 (getpoint "ѡȡ��һ�ǵ㣡\n"))
(setq P2(getcorner P1 "ѡȡ�ڶ��ǵ㣡\n")) 
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (car P2))
(setq P2Y (cadr P2))


  
(setvar "osmode" 0)
(setq PCX (/ (+ P1X P2X) 2))
(setq PCY (/ (+ P1Y P2Y) 2))
(setq PC (list PCX PCY ))



(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ����

(setq sel  (ssget "W" P1 P2))  
(if (/= sel Nil)
	(command "rotate" sel "" PC 90)
)




(setvar "osmode" ss)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")


) 


;;;;;����Ϊ���Բ��� 
;;;(setq sel (ssget ))    
;;;(setq first  (ssname sel 0))  
;;;(setq lst (entget first))



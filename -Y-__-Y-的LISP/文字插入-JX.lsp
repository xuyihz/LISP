;;;; ���� 2016-02-24 ������ ������ 
;;;; ���� 2016-06-12 ������ ������ 
;;;; ���ֲ���
(defun C:441()(SETVAR "CMDECHO" 0)	(setq new0 0)(setq  new1 1)
(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX 50 )
(setq DY 50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(WZCRYY new0 new1 "300" "0" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����

(defun C:451()(SETVAR "CMDECHO" 0) (setq new0 1)(setq  new1 1)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX 0 )
(setq DY 50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(setq Col 211 )
(WZCRYY new0 new1 "300" "0" "����" "TSSD_REIN" P2 Col)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����


(defun C:461()(SETVAR "CMDECHO" 0)	
(setq new0 2)(setq  new1 1)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX -50 )
(setq DY 50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))

(WZCRYY new0 new1 "300" "0" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����


(defun C:471()(SETVAR "CMDECHO" 0)	(setq new0 0)(setq  new1 3)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))(WZCRYY new0 new1 "300" "0" "����" "TSSD_REIN" P1)(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����



(defun C:481()(SETVAR "CMDECHO" 0)	(setq new0 1)(setq  new1 3)
(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX 0 )
(setq DY -50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(WZCRYY new0 new1 "300" "0" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����

(defun C:491()(SETVAR "CMDECHO" 0)	(setq new0 2)(setq  new1 3)
(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX -50 )
(setq DY -50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(setq Col 211 )
(WZCRYY new0 new1 "300" "0" "����" "TSSD_REIN" P2 Col)
(setvar "CMDECHO" 1)
(princ "�Ѳ���\n"));;;����


(defun C:541()(SETVAR "CMDECHO" 0)(setq new0 0)(setq  new1 1)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX -50 )
(setq DY 50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(WZCRYY new0 new1 "300" "90" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����



(defun C:551()
(SETVAR "CMDECHO" 0)
(setq new0 1)(setq  new1 1) 
(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX -50 )
(setq DY 0 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(WZCRYY new0 new1 "300" "90" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����



(defun C:561()
(SETVAR "CMDECHO" 0)	

(setq new0 2)(setq  new1 1)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX -50 )
(setq DY -50 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(WZCRYY new0 new1 "300" "90" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����



(defun C:571()(SETVAR "CMDECHO" 0)
(setq new0 0)
(setq  new1 3)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX 50 )
(setq DY 0 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))
(WZCRYY new0 new1 "300" "90" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����

(defun C:581()
(SETVAR "CMDECHO" 0)
(setq new0 1)(setq  new1 3)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(setq P1X (car P1))(setq P1Y (cadr P1))
(setq DX 50 )
(setq DY 0 )
(setq P2X (+ P1X DX ) )
(setq P2Y (+ P1Y DY ) )
(setq P2 (list P2X P2Y ))

(WZCRYY new0 new1 "300" "90" "����" "TSSD_REIN" P2)
(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����


(defun C:591()(SETVAR "CMDECHO" 0)	(setq new0 2)(setq  new1 3)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(WZCRYY new0 new1 "300" "90" "����" "TSSD_REIN" P1)(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;����




(defun C:313()(SETVAR "CMDECHO" 0)  (setq chklay  (getvar "clayer"))(command "clayer" "-Y-__-Y-����Ϣͼ��")(setq new0 1)(setq  new1 2)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))(WZCRYY new0 new1 "300" "0" "D:2.5" "TSSD_REIN" P1 "N")(command "change" "L" "" "p" "c" 2  "" )(command "clayer" chklay) (setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;�����������
(defun C:315()(SETVAR "CMDECHO" 0) (setq chklay  (getvar "clayer")) (command "clayer" "-Y-__-Y-����Ϣͼ��")(setq new0 1)(setq  new1 2)(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))(WZCRYY new0 new1 "300" "0" "A:2.5" "TSSD_REIN" P1)(command "change" "L" "" "p" "c" 4  "" )(command "clayer" chklay)(setvar "CMDECHO" 1)(princ "�Ѳ���\n"));;;�����������


(defun c:321() ;;;����ͼ��               
(SETVAR "CMDECHO" 0)	
(command "clayer" "S-DETL-TEXT")
(setq new0 1)(setq  new1 1)
(setq P1 (getpoint "ѡȡ���ֲ���㣡\n"))
(WZCRYY new0 new1 "500" "0" "������ͼ��" "����" P1)
(setvar "plinewid"  80)

(setq P1X (car P1))
(setq newP1X (- P1X 3000))

(setq newP2X (+ P1X 3000))
(setq P1Y (cadr P1))
(setq newP1Y (- P1Y 100))
(setq newP1 (list newP1X newP1Y ))
(setq newP2 (list newP2X newP1Y ))
(command "pline" newP1 newP2 "")

(setvar "CMDECHO" 1)
(princ "�Ѳ���\n")
)



(defun WZCRYY(duiqi1 duiqi2 HT aa CT TS P1)
(command "textstyle" TS )

(cond ( (and (= duiqi1 0 )(= duiqi2 1 )) (setq duiqiStyle "BL") )
	( (and (= duiqi1 0 )(= duiqi2 2 )) (setq duiqiStyle "ML") )
	( (and (= duiqi1 0 )(= duiqi2 3 )) (setq duiqiStyle "TL") )
	( (and (= duiqi1 1 )(= duiqi2 1 )) (setq duiqiStyle "BC") )
	( (and (= duiqi1 1 )(= duiqi2 2 )) (setq duiqiStyle "MC") )
	( (and (= duiqi1 1 )(= duiqi2 3 )) (setq duiqiStyle "TC") )
	( (and (= duiqi1 2 )(= duiqi2 1 )) (setq duiqiStyle "BR") )
	( (and (= duiqi1 2 )(= duiqi2 2 )) (setq duiqiStyle "MR") )
	( (and (= duiqi1 2 )(= duiqi2 3 )) (setq duiqiStyle "TR") )
)

(setvar "osmode" 0)
(command "text" "J" duiqiStyle P1  HT aa CT)
(setvar "osmode" 4271)
)







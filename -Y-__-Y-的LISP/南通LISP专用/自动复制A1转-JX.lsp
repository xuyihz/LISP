;;;; @-Y-__-Y- 2016-09-14 ������ �������� 
;;; ѡ��һ��ƽ��ͼ���Ͻ�
;;;�ʺ���ֻ��һ����ƽ��ͼ������



(defun C:998()
(SETVAR "CMDECHO" 0)

;;;��������
(setq DY0 -95600);;; ����ͼ����ͼ���һ��֮�����
(setq DY -95600);;;ԭͼÿ��������
(setq DXS 57400);;;ÿ��ͼ��
(setq DYS 80600);;;ÿ��ͼ��
(setq DXN (* DXS 1.2));;;��ͼˮƽ���
(setq DYN (* DYS 1.2));;;��ͼ������



(initget (+ 1 4))
(setq Num (getint "\n ����ʵ��¥����Ŀ��") ) 


(initget (+ 1 4))
(setq Num2 (getint "\n ���븽��ͼ��Ŀ������") ) 


(setq P0 (getpoint "ѡȡ��λ�����Ͻǵ㣡\n"))
(setq ss (getvar "osmode"))
(setvar "osmode" 1)
(setq P1 (getpoint "ѡȡԭͼ���Ͻǵ㣡\n"))
(setq P1X (car P1))
(setq P1Y (cadr P1))
(setq P2X (+ P1X DXS))
(setq P2Y (- P1Y DYS))
(setq P2 (list P2X P2Y ))

 
(setvar "osmode" 0)
(setq P0X (car P0))
(setq P0Y (+ (cadr P0) -25000))



;;;0-1����ͼ��
(setq P11X (+ P0X (* 0 0)))
(setq P11Y (+ P0Y (* 0 DYN)))
(setq P11 (list P11X P11Y ))
(command "insert" "A1���ת" P11 100 "" "")



(setq NewP1X (+ P1X 0))
(setq NewP1Y (+ P1Y (* -2 DY)))
(setq NewP1 (list NewP1X NewP1Y ))
(setq NewP2X (+ P2X 0))
(setq NewP2Y (+ P2Y (* -2 DY)))
(setq NewP2 (list NewP2X NewP2Y ))
 
;;; 
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ����


(progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-COLU-LINE*,*S-WALL-LINE*,S-SLAB-COLU,S-DETL-*,*S-FON-*" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*" "")
    (command "layer" "off" "S-COLU-DIM,S-COLU-LINE12,S-WALL-LINE12" "")
)
(setq sel  (ssget "W" NewP1 NewP2))  
(if (/= sel Nil)
	(command "copy" sel "" NewP1 P11)
)




;;;0-2���������Ե����
(setq P11X (+ P0X (* 1 DXN)))
(setq P11Y (+ P0Y (* 0 DYN)))
(setq P11 (list P11X P11Y ))
(command "insert" "A1���ת" P11 100 "" "")

(setq NewP1X (+ P1X 0))
(setq NewP1Y (+ P1Y (* -1 DY)))
(setq NewP1 (list NewP1X NewP1Y ))
(setq NewP2X (+ P2X 0))
(setq NewP2Y (+ P2Y (* -1 DY)))
(setq NewP2 (list NewP2X NewP2Y ))
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ����

(progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-COLU-LINE12,S-WALL-LINE12" "")
)

(setq sel  (ssget "W" NewP1 NewP2))  
(if (/= sel Nil)
	(command "copy" sel "" NewP1 P11)
)



;;;2 ���Ƹ���ͼ
;;;�õ���һ�Ÿ���ͼԭͼ��ʼ����
(setq DY2 (* (- Num 1) DY))
(setq P1NX  P1X)
(setq P1NY (+ (+ P1Y DY2) DY0 ))
(setq P2NX (+ P1NX DXS))
(setq P2NY (- P1NY DYS))
(setq P2N (list P2NX P2NY ))


;;;�õ���һ�Ÿ���ͼ��ͼ��ʼ����

(setq P0NX  (+ P0X (* 2 DXN)))  
(setq P0NY (+ P0Y 0))

(setq jj 0)
(while (< jj Num2)

;;;�õ���jj+1����ͼԭͼ��ʼ����
	(setq NewP1NX (+ P1NX 0))
	(setq NewP1NY (+ P1NY (* jj DY)))
	(setq NewP1N (list NewP1NX NewP1NY ))
	(setq NewP2NX (+ P2NX 0))
	(setq NewP2NY (+ P2NY (* jj DY)))
	(setq NewP2N (list NewP2NX NewP2NY ))

;;;�õ���jj+1�Ÿ���ͼ��ͼ��ʼ����
(setq P11NX (+ P0NX (* jj DXN)))
(setq P11NY (+ P0NY 0))
(setq P11N (list P11NX P11NY ))
(if (< jj Num)
(command "insert" "A1���ת" P11N 100 "" "")
)
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ���� 
(progn
    	(command "layer" "s" "S-DETL-TEXT" "")
    	(command "layer" "off" "*" "Y" "")
    	(command "layer" "on" "0,*BOX*,*iicon*" "")
    	(command "layer" "on" "*C-*,S-DETL-*,S-COLU-LINE*,S-WALL-*LINE*,S-BEAM-LINE*,S-COLU-HATCH" "")
 )  
	(setq sel  (ssget "W" NewP1N NewP2N))  
	(if (/= sel Nil)
		(command "copy" sel "" NewP1N P11N)
	)


(setq jj (+ jj 1))
)



(setq ii 0)
(while (< ii Num)
	
	(setq NewP1X (+ P1X 0))
	(setq NewP1Y (+ P1Y (* ii DY)))
	(setq NewP1 (list NewP1X NewP1Y ))
	(setq NewP2X (+ P2X 0))
	(setq NewP2Y (+ P2Y (* ii DY)))
	(setq NewP2 (list NewP2X NewP2Y ))



	(setq P11X (+ P0X (* ii 0)))
	(setq P11Y (- P0Y (* (+ ii 1) DYN)))
	(setq P11 (list P11X P11Y ))
	(command "insert" "A1���ת" P11 100 "" "")

	(setq P12X (+ P11X DXN))
	(setq P12Y (+ P11Y 0))
	(setq P12 (list P12X P12Y ))
	(command "insert" "A1���ת" P12 100 "" "")

	(setq P13X (+ P11X (* DXN 2)))
	(setq P13Y (+ P11Y 0))
	(setq P13 (list P13X P13Y ))
    (command "insert" "A1���ת" P13 100 "" "")


 ;   (setq P14X (+ P11X 480000))
	;(setq P14Y (+ P11Y 0))
	;(setq P14 (list P14X P14Y ))
 ;   (command "insert" "A1�ڿ�" P14 1 "" "")

 ;   (setq P15X (+ P14X DXN))
	;(setq P15Y (+ P14Y 0))
	;(setq P15 (list P15X P15Y ))
 ;   (command "insert" "A1�ڿ�" P15 1 "" "")

 ;   (setq P16X (+ P14X (* DXN 2)))
	;(setq P16Y (+ P14Y 0))
	;(setq P16 (list P16X P16Y ))
 ;   (command "insert" "A1�ڿ�" P16 1 "" "")

 ;   (setq P17X (+ P14X (* DXN 3)))
	;(setq P17Y (+ P14Y 0))
	;(setq P17 (list P17X P17Y ))
 ;   (command "insert" "A1�ڿ�" P17 1 "" "")

 ;   (setq P18X (+ P14X (* DXN 4)))
	;(setq P18Y (+ P14Y 0))
	;(setq P18 (list P18X P18Y ))
	;(if (= ii 0) (command "insert" "A1�ڿ�" P18 1 "" ""))
    

;;;���ư�ͼ��
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ����    
	(progn
    	(command "layer" "s" "S-SLAB-TEXT" "")
    	(command "layer" "off" "*" "Y" "")
    	(command "layer" "on" "0,*BOX*,*iicon*" "")
    	(command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
   	 	(command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    	(command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
 	)
	(setq sel  (ssget "W" NewP1 NewP2))  
	(if (/= sel Nil)
		(command "copy" sel "" NewP1 P11)
	)


;;;����X�������
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ����
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )

  
(setq sel  (ssget "W" NewP1 NewP2))  
(if (/= sel Nil)
	(command "copy" sel "" NewP1 P12)
)

;;;����Y�������
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ���� 
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )


   (setq sel  (ssget "W" NewP1 NewP2))  
(if (/= sel Nil)
	(command "copy" sel "" NewP1 P13)
	
)






;(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
;(command "layer" "on" "*" "") ;;;ȫ���� 
;  (progn
;    (command "layer" "s" "dsptext_beam" "")
;    (command "layer" "off" "*" "Y" "")
;    (command "layer" "on" "0,dsptext_beam" "")
;   )


;   (setq sel  (ssget "W" NewP1 NewP2))  
;(if (/= sel Nil)
;	(command "copy" sel "" NewP1 P14)
	
;)


;(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
;(command "layer" "on" "*" "") ;;;ȫ���� 
;  (progn
;    (command "layer" "s" "������_X" "")
;    (command "layer" "off" "*" "Y" "")
;    (command "layer" "on" "0,������_X" "")
;   )


;   (setq sel  (ssget "W" NewP1 NewP2))  
;(if (/= sel Nil)
;	(command "copy" sel "" NewP1 P17)
	
;)


(setq ii (+ ii 1))
)
   
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ���� 

(setvar "osmode" ss)
(setvar "CMDECHO" 1)
(princ "����������ȷ\n")


) 


;;;;;����Ϊ���Բ��� 
;;;(setq sel (ssget ))    
;;;(setq first  (ssname sel 0))  
;;;(setq lst (entget first))



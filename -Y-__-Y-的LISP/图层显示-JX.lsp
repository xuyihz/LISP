;;;; ���� 2015-11-9 ����һ�� ��������
;;;; ���� 2016-06-12 �����ա� ������



 ;;;;ȫ����
(defun c:09() 
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "on" "*" "") ;;;ȫ����
(setvar "CMDECHO" 1)
(prin1)
)

;;;;ѡ��ͼ����ʾ 
;;;;�������޷�ָ������
;;;;YYΪ�̶���׺
(defun c:05( / sel aa ii first lst laname) 
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ

(setq sel (ssget))
;;;(set Culayer (getvar "clayer"))
(command "clayer" "0") 
(command "layer" "off" "*" "Y"  "") ;;;ȫ���رհ�����ͼ��

(setq aa (sslength sel))
(setq ii 0)
(while (< ii aa)
(progn 
    (setq first  (ssname sel ii)) 
    (setq lst (entget first))
    (setq laname (cdr (assoc 8 lst))) 
    (command "layer" "on" laname "")
    (setq ii (+ ii 1))
)
)
;;;(command "clayer" Culayer)      
(setvar "CMDECHO" 1)
(prin1)
)


(defun c:06( / sel aa ii first lst laname) ;;;ѡ�йر�
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ

(setq sel (ssget))
;;;(set Culayer (getvar "clayer"))
(command "clayer" "0") 


(setq aa (sslength sel))
(setq ii 0)
(while (< ii aa)
(progn 
    (setq first  (ssname sel ii)) 
    (setq lst (entget first))
    (setq laname (cdr (assoc 8 lst))) 
    (command "layer" "off" laname "")
    (setq ii (+ ii 1))
)
)
;;;(command "clayer" Culayer)      
(setvar "CMDECHO" 1)
(prin1)
)

(defun c:061( / sel aa ii first lst laname) ;;;�ر���ͼ��
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ


;;;(set Culayer (getvar "clayer"))
(command "clayer" "0") 



    (command "layer" "off" "*S-BEAM-LINE*" "")

;;;(command "clayer" Culayer)      
(setvar "CMDECHO" 1)
(prin1)
)

;;;(cond ((= laname "S-COLU-TEXT") (command "layer" "off" "S-COLU-TEXT" "") )
;;;      ((= laname "S-COLU-LINE1") (command "layer" "off" "S-COLU-LINE1" "") )
;;;)


;;�ϲ������ƽ��ͼ��һ �������շ�ͼ��
(defun c:01 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


;;�ϲ������ƽ��ͼ��һ ������������
(defun c:0011 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "on" "0,*BOX*,*iicon*,�����б�ע,��ԭλ��ע" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,������_X,WPJMAX,WPJMIN,����,����,SPRE_SPECBE_TF" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
(defun c:00112 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "on" "0,*BOX*,*iicon*,�����б�ע,��ԭλ��ע" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,����,����,SPRE_SPECBE_TF,dsptext_beam" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ������ƽ��ͼ��һ ������������
(defun c:0012 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-��*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,������_X,��,������,����,��ǽ,��,dsptext_beam" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ������ƽ��ͼ������
(defun c:02 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ������ƽ��ͼ���� ������������
(defun c:0021 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,������_Y,WPJMAX,WPJMIN,����,����,SPRE_SPECBE_TF"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ������ƽ��ͼ���� ������������
(defun c:00212 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*����,����,SPRE_SPECBE_TF,dsptext_beam"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ������ƽ��ͼ���� ������������
(defun c:0022 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-��*" "")
    (command "layer" "on" "*C-ICON*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,������_Y,��,������,����,��ǽ,��"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

 ;;(progn
   ;; (command "layer" "s" "S-BEAM-Y" "")
    ;;(command "layer" "off" "*" "Y" "")
    ;;(command "layer" "on" "0,*BOX*,*iicon*,*AXIS*" "")
   ;; (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU"  "")
   ;; (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*" "")
   ;; (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
   ;; (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
  ;; )

;;�ϲ��ṹƽ��ͼ
(defun c:00 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-SLAB-TEXT" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ��ṹƽ��ͼ
(defun c:0001 (/) ;;������ʾ�޸ĵ���Ϣ������������
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-�ĸ���ͼ��" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-COLU-*,S-SLAB-DIM,S-SLAB-R*,S-SLAB-HOLE,S-SLAB-ROOF,,S-SLAB-TEXT,*S-WALL-*,S-DETL-*,12,13" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,*S-BEAM-X*,*S-BEAM-Y*" "")
    (command "layer" "on" "-Y-__-Y-��*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
 
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ��ṹƽ��ͼ,��ʾ��������ǽ
(defun c:0003 (/)
	(prompt "�ϲ��ṹƽ��ͼ,��ʾ��������ǽ\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ��ṹƽ��ͼ,��ʾ��������ǽ���������(���ڸ��Լ���ʾ���нṹ����)
(defun c:0006 (/)
	(prompt "�ϲ��ṹƽ��ͼ,��ʾ��������ǽ���������(���ڸ��Լ���ʾ������ʾ�ṹ����\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,*S-BEAM-X*,*S-BEAM-Y*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ��ṹƽ��ͼ,��ʾ��������ǽ���������(���ڸ�������ʾ�ṹ����)
(defun c:00061 (/)
  (prompt "�ϲ��ṹƽ��ͼ,��ʾ��������ǽ���������(���ڸ�������ʾ�ṹ����\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-�Ľ�עͼ��,-Y-__-Y-����ͼ��" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,*S-BEAM-X*,*S-BEAM-Y*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:0002 (/) ;;��ʾ������Ϣͼ�������ǽ
	(prompt "��ʾ������Ϣͼ�������ǽ\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-����Ϣͼ��" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-����Ϣͼ��*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-SLAB-TEXT*,*S-SLAB-R*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:0004 (/);;������ʾǽ����������
	(prompt "������ʾǽ����������\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-COLU-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
(defun c:00042 (/);;������ʾǽ������������У��
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-COLU-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,�����Ʊ��,����,����" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ��ṹƽ��ͼ,�������������,���������޸�
(defun c:0005 (/)
	(prompt "�ϲ��ṹƽ��ͼ,�������������,���������޸�\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-ICON*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*,S-COLU-HATCH*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ "�����������ṹƽ��ͼ\n")
)

;;�ϲ��ṹƽ��ͼ,������ʾ�ṹ�ϲ���ȷ�Ĳ���
(defun c:0007 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-�Ľ���ͼ��" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "-Y-__-Y-�Ľ���ͼ��" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ��ṹƽ��ͼ,������ʾ�ṹ�ϲ���ȷ�Ĳ���
(defun c:0008 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-�Ľ���ͼ��" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "-Y-__-Y-�Ľ���ͼ��" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ��ṹƽ��ͼ,��ʾ��������ǽ
(defun c:00081 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,14000,21000" "")
    (command "layer" "on" "*000,*S-BEAM-X*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;�ϲ��ṹƽ��ͼ,��ʾ��������ǽ
(defun c:00082 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,14000,21000" "")
    (command "layer" "on" "*000,*S-BEAM-Y*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;�ϲ��ṹƽ��ͼ �������������
(defun c:003JGPM (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-SLAB-TEXT" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,*AXIS*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "S-COLU-HATCH" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:07() ;;;������ʾ�����úͽ���ͼ��
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;ȫ����
    (command "layer" "s" "0" "")
    (command "layer" "off" "0" "Y" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-��*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "*S-COLU-LINE1*,*S-COLU-LINE2*,,*S-COLU-HATCH*,*S-BEAM-LINE*,*S-BEAM-X,*S-BEAM-Y" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:071() ;;;������ʾƽ�沼�úͽ���ͼ��
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;ȫ����
    (command "layer" "s" "0" "")
    (command "layer" "off" "0" "Y" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-��*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "*S-COLU-LINE1*,*S-COLU-LINE2*,*S-BEAM-LINE*,*S-SLAB-TEXT,*S-SLAB-HOLE" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:072() ;;;������ʾ���ͽ���ͼ��
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;ȫ����
    (command "layer" "s" "0" "")
    (command "layer" "off" "0" "Y" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-��*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "*S-COLU-LINE1*,*S-COLU-LINE2*,*S-COLU-HATCH*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:004DKLXTC() ;;;������ͼ��
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "off" "*" "N" "") ;;;ȫ���ر�
(command "layer" "on" "S-BEAM-LINE1" "")
(command "layer" "on" "S-BEAM-LINE2" "")
(command "layer" "on" "S-COLU-LINE1" "")
(command "layer" "on" "S-COLU-LINE2" "")
(command "layer" "on" "S-SLAB-COLU" "")
(command "layer" "on" "C-DOTE" "")
(setvar "CMDECHO" 1)
(prin1)
)


(defun c:0061DkLMJTC() ;;;�������ͼ��
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "off" "dsptext_beam_Y" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam_X" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)

(defun c:0062DkLMJTC() ;;;�������ͼ��
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "off" "dsptext_beam_X" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam_Y" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)


;;;��ʱ����
(defun c:0071DKLMJTC() ;;;�ر������ͼ��
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "off" "dsptext_beam_*" "") ;;;ȫ���ر�
(command "layer" "off" "dsptext_beam2" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam1" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)



(defun c:0072DKLMJTC() ;;;�ر������ͼ��
(setvar "CMDECHO" 0) ;;ʹ����ʾ������ʾ
(command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
(command "layer" "off" "dsptext_beam_*" "") ;;;ȫ���ر�
(command "layer" "off" "dsptext_beam2" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam1" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)


;;�ر��ϲ��ṹƽ��ͼ
(defun c:0000 (/) 
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;ȫ����
    (command "layer" "s" "0" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-��*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")

  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;ǽ�����ƽ��ͼ����
(defun c:03(/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-COLU-LINE12,S-WALL-LINE12" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;ǽ�����ƽ��ͼ����
(defun c:0031(/) ;;;;���ڱ�Ե�������
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-�������ͼ��,ǽ������,��������,ǽ������,ǽ����������,�ֲ�������,WPJMAX,WPJMIN,�����Ʊ��,����,����,SPRE_SPECBE_TF,dsptext_col" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-DETL-AXIS*,*S-COLU-HATCH*,*S-WALL-BEHATCH" "")
    (command "layer" "off" "*S-0-LINE-ADD1*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
(defun c:0032(/);;;����ǽ���
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-�������ͼ��,ǽ������,�ֲ�������" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-DETL-AXIS*,*S-COLU-HATCH*,*S-WALL-BEHATCH,*S-COLU-DIM" "")
    (command "layer" "off" "*S-0-LINE-ADD1*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:0034(/);;;���ڻ��ƹ����Ե����
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-ICON*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,ǽ������(��)" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-DETL-AXIS*,*S-COLU-DIM" "")
    (command "layer" "off" "*S-0-LINE-ADD1*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:0035(/) ;;;���ڲ鿴��Ե�����Ƿ�������
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-ICON*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*,*S-COLU-DIM" "")
    (command "layer" "off" "*S-0-LINE-ADD1*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:04 (/);;;�����ṹƽ��ͼ
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-COLU-LINE*,*S-WALL-LINE*,*S-WALL-WLINE*,S-SLAB-COLU,S-SLAB-HATCH,S-DETL-*,*S-FON-*" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*" "")
    (command "layer" "off" "S-COLU-LINE12,S-WALL-LINE12" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:0041 (/);;;�����ṹƽ��ͼ���б�ţ�
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,dsptext_col" "")
    (command "layer" "on" "*C-*,*S-COLU-LINE*,*S-WALL-LINE*,*S-WALL-WLINE*,S-SLAB-COLU,S-DETL-*,*S-FON-*,-Y-__-Y-�������ͼ��" "")
    (command "layer" "on" "24200,22000" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*" "")
    (command "layer" "off" ",S-COLU-LINE12,S-WALL-LINE12" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:08 (/);;;��ʾ��ͼ
	  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
    	(command "layer" "s" "S-DETL-TEXT" "")
    	(command "layer" "off" "*" "Y" "")
    	(command "layer" "on" "0,*BOX*,*iicon*" "")
    	(command "layer" "on" "*C-*,S-DETL-*,S-BEAM-LINE*,S-BEAM-*RBAR*,S-COLU-LINE*,S-WALL-*LINE*,S-COLU-HATCH,S-SLAB-HOLE" "")


  (setvar "CMDECHO" 1)
  (princ)
)
(defun c:081 (/);;;������ʾ����ͼ�л�����Щû�ĵ�
	  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
   (command "clayer" "0") ;;;�õ�ǰͼ��Ϊ��ͼ��
   (command "layer" "on" "*" "") ;;;ȫ����
    	(command "layer" "off" "*C-*,S-DETL-*,S-BEAM-LINE*,S-BEAM-*RBAR*,S-COLU-LINE*,S-WALL-*LINE*,S-COLU-HATCH,S-SLAB-HOLE" "")


  (setvar "CMDECHO" 1)
  (princ)
)
;;;; 姜雄 2015-11-9 星期一· 天气阴雨
;;;; 姜雄 2016-06-12 星期日· 天气雨



 ;;;;全部打开
(defun c:09() 
(setvar "CMDECHO" 0) ;;使不显示命令提示
(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "on" "*" "") ;;;全部打开
(setvar "CMDECHO" 1)
(prin1)
)

;;;;选中图层显示 
;;;;本程序无法指定区域
;;;;YY为固定后缀
(defun c:05( / sel aa ii first lst laname) 
(setvar "CMDECHO" 0) ;;使不显示命令提示

(setq sel (ssget))
;;;(set Culayer (getvar "clayer"))
(command "clayer" "0") 
(command "layer" "off" "*" "Y"  "") ;;;全部关闭包括零图层

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


(defun c:06( / sel aa ii first lst laname) ;;;选中关闭
(setvar "CMDECHO" 0) ;;使不显示命令提示

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

(defun c:061( / sel aa ii first lst laname) ;;;关闭梁图层
(setvar "CMDECHO" 0) ;;使不显示命令提示


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


;;上部梁配筋平面图（一 用于最终分图）
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


;;上部梁配筋平面图（一 包含配筋面积）
(defun c:0011 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "on" "0,*BOX*,*iicon*,梁集中标注,梁原位标注" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,配筋面积_X,WPJMAX,WPJMIN,砼梁,砼柱,SPRE_SPECBE_TF" "")
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
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "on" "0,*BOX*,*iicon*,梁集中标注,梁原位标注" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,砼梁,砼柱,SPRE_SPECBE_TF,dsptext_beam" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;上部梁配筋平面图（一 包含配筋面积）
(defun c:0012 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-X" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,配筋面积_X,梁,梁虚线,网格,砼墙,柱,dsptext_beam" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,S-BEAM-Y*,*S-BEAM-YRBAR*,*S-BEAM-YCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;上部梁配筋平面图（二）
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
;;上部梁配筋平面图（二 包含配筋面积）
(defun c:0021 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,配筋面积_Y,WPJMAX,WPJMIN,砼梁,砼柱,SPRE_SPECBE_TF"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;上部梁配筋平面图（二 包含配筋面积）
(defun c:00212 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*砼梁,砼柱,SPRE_SPECBE_TF,dsptext_beam"  "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "off" "*S-0-LINE-ADD1*,*S-BEAM-X*,*S-BEAM-XRBAR*,*S-BEAM-XCHECK*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;上部梁配筋平面图（二 包含配筋面积）
(defun c:0022 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-Y" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的*" "")
    (command "layer" "on" "*C-ICON*,*S-0-*,*S-BST-*,*S-BEAM-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,配筋面积_Y,梁,梁虚线,网格,砼墙,柱"  "")
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

;;上部结构平面图
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
;;上部结构平面图
(defun c:0001 (/) ;;用于显示修改等信息，给其他方面
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-的辅助图层" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-COLU-*,S-SLAB-DIM,S-SLAB-R*,S-SLAB-HOLE,S-SLAB-ROOF,,S-SLAB-TEXT,*S-WALL-*,S-DETL-*,12,13" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,*S-BEAM-X*,*S-BEAM-Y*" "")
    (command "layer" "on" "-Y-__-Y-的*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
 
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;上部结构平面图,显示梁，柱，墙
(defun c:0003 (/)
	(prompt "上部结构平面图,显示梁，柱，墙\n")
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

;;上部结构平面图,显示梁，柱，墙，所有配筋(用于给自己显示所有结构布置)
(defun c:0006 (/)
	(prompt "上部结构平面图,显示梁，柱，墙，所有配筋(用于给自己显示所有显示结构布置\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,*S-BEAM-X*,*S-BEAM-Y*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;上部结构平面图,显示梁，柱，墙，所有配筋(用于给建筑显示结构布置)
(defun c:00061 (/)
  (prompt "上部结构平面图,显示梁，柱，墙，所有配筋(用于给建筑显示结构布置\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-的建注图层,-Y-__-Y-的修图层" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,*S-BEAM-X*,*S-BEAM-Y*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:0002 (/) ;;显示包含信息图层的梁柱墙
	(prompt "显示包含信息图层的梁柱墙\n")
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-的信息图层" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的信息图层*" "")
    (command "layer" "on" "*C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-SLAB-TEXT*,*S-SLAB-R*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:0004 (/);;单纯显示墙、柱和轴网
	(prompt "单纯显示墙、柱和轴网\n")
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
(defun c:00042 (/);;单纯显示墙、柱和轴网，校对
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-COLU-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,柱名称编号,砼梁,砼柱" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;上部结构平面图,无轴网，无填充,用于梁线修改
(defun c:0005 (/)
	(prompt "上部结构平面图,无轴网，无填充,用于梁线修改\n")
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
  (princ "无轴网无填充结构平面图\n")
)

;;上部结构平面图,用于显示结构上不明确的部分
(defun c:0007 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-的建疑图层" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "-Y-__-Y-的建疑图层" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;上部结构平面图,用于显示结构上不明确的部分
(defun c:0008 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "-Y-__-Y-的结疑图层" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "-Y-__-Y-的结疑图层" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;上部结构平面图,显示梁，柱，墙
(defun c:00081 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,14000,21000" "")
    (command "layer" "on" "*000,*S-BEAM-X*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)
;;上部结构平面图,显示梁，柱，墙
(defun c:00082 (/)
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-BEAM-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "C-*,*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*" "")
    (command "layer" "on" "*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-STEEL-BTEXT*,14000,21000" "")
    (command "layer" "on" "*000,*S-BEAM-Y*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-*-RBAR*,*S-*-*TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;上部结构平面图 但不包括柱填充
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

(defun c:07() ;;;用于显示梁布置和建筑图层
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;全部打开
    (command "layer" "s" "0" "")
    (command "layer" "off" "0" "Y" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-的*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "*S-COLU-LINE1*,*S-COLU-LINE2*,,*S-COLU-HATCH*,*S-BEAM-LINE*,*S-BEAM-X,*S-BEAM-Y" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:071() ;;;用于显示平面布置和建筑图层
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;全部打开
    (command "layer" "s" "0" "")
    (command "layer" "off" "0" "Y" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-的*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "*S-COLU-LINE1*,*S-COLU-LINE2*,*S-BEAM-LINE*,*S-SLAB-TEXT,*S-SLAB-HOLE" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:072() ;;;用于显示柱和建筑图层
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;全部打开
    (command "layer" "s" "0" "")
    (command "layer" "off" "0" "Y" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-的*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")
    (command "layer" "on" "*S-COLU-LINE1*,*S-COLU-LINE2*,*S-COLU-HATCH*" "")
  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)


(defun c:004DKLXTC() ;;;打开梁线图层
(setvar "CMDECHO" 0) ;;使不显示命令提示
(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "off" "*" "N" "") ;;;全部关闭
(command "layer" "on" "S-BEAM-LINE1" "")
(command "layer" "on" "S-BEAM-LINE2" "")
(command "layer" "on" "S-COLU-LINE1" "")
(command "layer" "on" "S-COLU-LINE2" "")
(command "layer" "on" "S-SLAB-COLU" "")
(command "layer" "on" "C-DOTE" "")
(setvar "CMDECHO" 1)
(prin1)
)


(defun c:0061DkLMJTC() ;;;打开梁面积图层
(setvar "CMDECHO" 0) ;;使不显示命令提示
(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "off" "dsptext_beam_Y" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam_X" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)

(defun c:0062DkLMJTC() ;;;打开梁面积图层
(setvar "CMDECHO" 0) ;;使不显示命令提示
(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "off" "dsptext_beam_X" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam_Y" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)


;;;暂时闲置
(defun c:0071DKLMJTC() ;;;关闭梁面积图层
(setvar "CMDECHO" 0) ;;使不显示命令提示
(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "off" "dsptext_beam_*" "") ;;;全部关闭
(command "layer" "off" "dsptext_beam2" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam1" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)



(defun c:0072DKLMJTC() ;;;关闭梁面积图层
(setvar "CMDECHO" 0) ;;使不显示命令提示
(command "clayer" "0") ;;;置当前图层为零图层
(command "layer" "off" "dsptext_beam_*" "") ;;;全部关闭
(command "layer" "off" "dsptext_beam2" "") ;;;
(command "layer" "off" "dsptext_col" "") ;;;
(command "layer" "on" "dsptext_beam1" "") ;;;
(setvar "CMDECHO" 1)
(prin1)
)


;;关闭上部结构平面图
(defun c:0000 (/) 
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
	(command "layer" "on" "*" "") ;;;全部打开
    (command "layer" "s" "0" "")
    (command "layer" "off" "*S-0-*,*S-BST-*,*S-SLAB-*,*S-COLU-*,*S-WALL-*,S-DETL-*,-Y-__-Y-的*" "")
    (command "layer" "off" "*S-BEAM-*,*S-STEEL-BTEXT*" "")
    (command "layer" "off" "*S-COLU-DIM*,*S-COLU-RBAR*,*S-COLU-TEXT*,*S-WALL-BELINE*,*S-WALL-BEHATCH*,*S-WALL-HOLE*,*S-COLU-CHECK*,*S-DETL-AXIS*" "")

  )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

;;墙柱配筋平面图（）
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

;;墙柱配筋平面图（）
(defun c:0031(/) ;;;;用于边缘构件配筋
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的配筋修图层,墙配筋面积,柱配筋面积,墙柱文字,墙柱高亮部分,分布筋文字,WPJMAX,WPJMIN,柱名称编号,砼梁,砼柱,SPRE_SPECBE_TF,dsptext_col" "")
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
(defun c:0032(/);;;用于墙配筋
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,-Y-__-Y-的配筋修图层,墙配筋面积,分布筋文字" "")
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


(defun c:0034(/);;;用于绘制构造边缘构件
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*" "")
    (command "layer" "on" "*C-ICON*,*S-0-*,*S-BST-*,*S-COLU-*,*S-WALL-*,S-SLAB-COLU,S-DETL-*,墙柱轮廓(虚)" "")
    (command "layer" "on" "*S-SLAB-HOLE*,*S-SLAB-ROOF*,*S-BEAM-LINE1*,*S-BEAM-LINE2*,*S-SLAB-HATCH*,S-SLAB-QLLINE" "")
    (command "layer" "off" "*S-DETL-AXIS*,*S-COLU-DIM" "")
    (command "layer" "off" "*S-0-LINE-ADD1*" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:0035(/) ;;;用于查看边缘构件是否配筋完毕
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


(defun c:04 (/);;;基础结构平面图
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

(defun c:0041 (/);;;基础结构平面图（有编号）
  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
  (progn
    (command "layer" "s" "S-WALL-LINE1" "")
    (command "layer" "off" "*" "Y" "")
    (command "layer" "on" "0,*BOX*,*iicon*,dsptext_col" "")
    (command "layer" "on" "*C-*,*S-COLU-LINE*,*S-WALL-LINE*,*S-WALL-WLINE*,S-SLAB-COLU,S-DETL-*,*S-FON-*,-Y-__-Y-的配筋修图层" "")
    (command "layer" "on" "24200,22000" "")
    (command "layer" "off" "*S-DETL-AXIS*,S-COLU-HATCH*" "")
    (command "layer" "off" ",S-COLU-LINE12,S-WALL-LINE12" "")
   )
  (command ".undo" "end")
  (command "_.UCS" "WORLD")
  (setvar "CMDECHO" 1)
  (princ)
)

(defun c:08 (/);;;显示详图
	  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
    	(command "layer" "s" "S-DETL-TEXT" "")
    	(command "layer" "off" "*" "Y" "")
    	(command "layer" "on" "0,*BOX*,*iicon*" "")
    	(command "layer" "on" "*C-*,S-DETL-*,S-BEAM-LINE*,S-BEAM-*RBAR*,S-COLU-LINE*,S-WALL-*LINE*,S-COLU-HATCH,S-SLAB-HOLE" "")


  (setvar "CMDECHO" 1)
  (princ)
)
(defun c:081 (/);;;用于显示附加图中还有哪些没改掉
	  (setvar "CMDECHO" 0)
  (command ".undo" "begin")
   (command "clayer" "0") ;;;置当前图层为零图层
   (command "layer" "on" "*" "") ;;;全部打开
    	(command "layer" "off" "*C-*,S-DETL-*,S-BEAM-LINE*,S-BEAM-*RBAR*,S-COLU-LINE*,S-WALL-*LINE*,S-COLU-HATCH,S-SLAB-HOLE" "")


  (setvar "CMDECHO" 1)
  (princ)
)
;;;; 姜雄 2015-10-16 星期五 天气晴
;;;; 姜雄 2016-06-12 星期日 天气雨  
;;;;切换图层
(defun c:091() (command "clayer" "C-DOTE") (prin1))
(defun c:095()(setvar "CMDECHO" 0) (command "clayer" "C-DIM") (setvar "CMDECHO" 1)(prin1))
(defun c:093()(setvar "CMDECHO" 0) (command "clayer" "C-ICON") (setvar "CMDECHO" 1)(prin1))
(defun c:0SA5() (command "clayer" "C-DOTENUM") (prin1))
(defun c:0SA6() (command "clayer" "DEFPOINTS") (prin1))
(defun c:096() (command "clayer" "-Y-__-Y-的信息图层2") (prin1))
(defun c:097() (command "clayer" "-Y-__-Y-的信息图层") (prin1))
(defun c:098() (command "clayer" "-Y-__-Y-的云线图层") (prin1))
(defun c:099() (command "clayer" "-Y-__-Y-的辅助图层") (prin1))
(defun c:094() (command "clayer" "-Y-__-Y-的配筋修图层") (prin1))


(defun c:0SAM() (command "clayer" "S-0-MODIFY") (prin1))
(defun c:0SAT() (command "clayer" "S-0-TEXT") (prin1))
(defun c:0SAH() (command "clayer" "S-0-HATCH") (prin1))
(defun c:0SA1() (command "clayer" "S-0-LINE-ADD1") (prin1))
(defun c:0SA2() (command "clayer" "SS-0-LINE-ADD2") (prin1))

(defun c:010() (command "clayer" "S-BEAM-TEXT") (prin1))
(defun c:011() (setvar "CMDECHO" 0)(command "clayer" "S-BEAM-LINE1")(setvar "CMDECHO" 1) (princ "已切换至图层  S-BEAM-LINE1"))
(defun c:012() (command "clayer" "S-BEAM-LINE2") (prin1))
(defun c:013() (command "clayer" "S-BEAM-X") (prin1))
(defun c:014() (command "clayer" "S-BEAM-Y") (prin1))
(defun c:015() (command "clayer" "S-BEAM-DIM") (prin1))
(defun c:016() (command "clayer" "S-BEAM-XRBAR") (prin1))
(defun c:017() (command "clayer" "S-BEAM-YRBAR") (prin1))



(defun c:005() (command "clayer" "S-SLAB-DIM") (prin1))
(defun c:007() (command "clayer" "S-SLAB-GZ") (prin1))
(defun c:008() (command "clayer" "S-SLAB-HATCH") (prin1))
(defun c:004() (command "clayer" "S-SLAB-HOLE") (prin1))
(defun c:006() (command "clayer" "S-SLAB-QLLINE") (prin1))
(defun c:002() (command "clayer" "S-SLAB-RBAR") (prin1))
(defun c:003() (command "clayer" "S-SLAB-RTEXT") (prin1))
(defun c:001() (command "clayer" "S-SLAB-ROOF") (prin1))
(defun c:000() (command "clayer" "S-SLAB-TEXT")(prompt "已切换至图层  S-SLAB-TEXT\n"))



(defun c:023() (setvar "CMDECHO" 0)(command "clayer" "S-COLU-RBAR") (setvar "CMDECHO" 1)(prin1))
(defun c:020() (setvar "CMDECHO" 0)(command "clayer" "S-COLU-TEXT") (setvar "CMDECHO" 1)(prin1))
(defun c:021() (setvar "CMDECHO" 0)(command "clayer" "S-COLU-LINE1") (setvar "CMDECHO" 1) (prompt "已切换至图层  S-COLU-LINE1\n"))
(defun c:022() (setvar "CMDECHO" 0)(command "clayer" "S-COLU-LINE2") (setvar "CMDECHO" 1)(prin1))
(defun c:028() (setvar "CMDECHO" 0)(command "clayer" "S-COLU-HATCH") (setvar "CMDECHO" 1) (prompt "已切换至图层  S-COLU-HATCH\n"))
(defun c:025() (command "clayer" "S-COLU-DIM") (prin1))
(defun c:0212() (command "clayer" "柱配筋面积") (prin1))

(defun c:041() (command "clayer" "S-WALL-LINE1") (prin1))
(defun c:042() (command "clayer" "S-WALL-LINE2") (prin1))
(defun c:043() (command "clayer" "S-WALL-WLINE1") (prin1))
(defun c:044() (command "clayer" "S-WALL-WLINE2") (prin1))
(defun c:046() (command "clayer" "S-WALL-BELINE") (prin1))
(defun c:047() (command "clayer" "S-WALL-BEHATCH") (prin1))
(defun c:040() (command "clayer" "S-WALL-TEXT") (prin1))
(defun c:048() (command "clayer" "S-WALL-WHATCH") (prin1));;;地下室外墙填充

(defun c:030() (command "clayer" "S-FON-TEXT") (prin1))
(defun c:031() (command "clayer" "S-FON-LINE1") (prin1))
(defun c:032() (command "clayer" "S-FON-LINE2") (prin1))
(defun c:033() (command "clayer" "S-FON-RBAR") (prin1))
(defun c:035() (command "clayer" "S-FON-DIM") (prin1))
(defun c:034() (command "clayer" "S-PILE-LINE") (prin1))
(defun c:037() (command "clayer" "S-PILE-TEXT") (prin1))
(defun c:036() (command "clayer" "S-PILE-CENLINE") (prin1))

(defun c:057() (command "clayer" "S-DETL-AXIS") (prin1))
(defun c:055() (command "clayer" "S-DETL-DIM") (prin1))
(defun c:058() (command "clayer" "S-DETL-HATCH") (prin1))
(defun c:051() (command "clayer" "S-DETL-LINE1") (prin1))
(defun c:052() (command "clayer" "S-DETL-LINE2") (prin1))
(defun c:053() (command "clayer" "S-DETL-RBAR") (prin1))
(defun c:050() (command "clayer" "S-DETL-TEXT") (prin1))

(defun c:0SLB() (command "clayer" "S-STEEL-BEAM") (prin1))
(defun c:0SLT() (command "clayer" "S-STEEL-BTEXT") (prin1))
(defun c:0SLC() (command "clayer" "S-STEEL-COLU") (prin1))
(defun c:0SLH() (command "clayer" "S-STEEL-CHATCH") (prin1))
(defun c:0SLB() (command "clayer" "S-STEEL-SYMB") (prin1))





(defun c:90() 
(setvar "CMDECHO" 0) ;;使不显示命令提示
(setq sel (ssget))
(setq first  (ssname sel 0)) 
(setq lst (entget first))
(setq laname (cdr (assoc 8 lst))) 
(prompt (strcat "选中的图层为 " laname "\n"))
(command "clayer" laname)
(setvar "CMDECHO" 1)
(prin1))
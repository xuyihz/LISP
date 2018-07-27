; Generate an Arc Steel Beam
; 
; Jiang Xiong, 2018
; Xu Yi, 2018, revised

(defun C:asb() ; defun : Defines a function

    ; 输入圆心及两端点
    (setq CoC (getpoint "\nselect the center of a circle")) ; setq : Sets the value of a symbol or symbols to associated expressions
                                        ; (setq sym expr [sym expr]...) 
                                        ; getpoint : Pauses for user input of a point, and returns that point
                                        ; (getpoint [pt] [msg]) 
    (setq P_start_raw (getpoint "\nselect the start point of the arc beam (Counterclockwise)"))

    (repeat 101 ; repeat : Evaluates each expression a specified number of times, and returns the value of the last expression
                ; (repeat int [expr...])
        (setq P_end_raw (getpoint "\nselect the end point of the arc beam (Counterclockwise)"))

        (setq osmode_backup (getvar "osmode")) ; osmode : 设置执行的对象捕捉模式
;        (setvar "osmode" 0)                    ; 0 : 无

        (setq angle_Ps_raw (angle CoC P_start_raw)) ; angle : Returns an angle in radians of a line defined by two endpoints
        (setq angle_Pe_raw (angle CoC P_end_raw))
        (setq radius (distance CoC P_start_raw) ) ; distance : Returns the 3D distance between two points
        (setq angle_adjust_beam (/ 400 radius) ) ; 弧梁空开柱子的位置。大概缩回400。
        (setq angle_Ps (+ angle_Ps_raw angle_adjust_beam ))
        (setq angle_Pe (- angle_Pe_raw angle_adjust_beam ))
        ; 绘制弧梁
        (setq  P_start (polar CoC angle_Ps radius)) ; polar : Returns the UCS 3D point at a specified angle and distance from a point
                                                     ; (polar pt ang dist)
        (setq  P_end (polar CoC angle_Pe radius) )
        (command "clayer" "Gjlx")   ; command : Executes an AutoCAD command
                                    ; clayer : 设置当前图层。
        (setvar "plinewid" 100) ; setvar : Sets an AutoCAD system variable to a specified value
                                ; plinewid : 存储默认的多段线宽度。
        (command "PLINE"  P_start "A" "CE" CoC P_end "") ; PLINE : 创建二维多段线。
        ; 绘制刚接符号
        (setq angle_adjust_triangle (/ 250 radius) )
        (setq angle_tri_start (+ angle_Ps angle_adjust_triangle ))
        (setq angle_tri_end (- angle_Pe angle_adjust_triangle ))
        (setq P_tri_start (polar CoC angle_tri_start radius))
        (setq P_tri_end (polar CoC angle_tri_end radius) )
        (command "clayer" "STPM_RBEAM_SIG")
        (command "PLINE"  P_end "W" 250 0 P_tri_end "") ; 绘制刚接符号(三角形)
        (command "PLINE"  P_start "W" 250 0 P_tri_start "")

        (setq P_start_raw P_end_raw) ; 设 P_end_raw 为 P_start_raw，画下一个弧梁。
        (command "clayer" "0")
;        (setvar "osmode" osmode_backup)
    )
)

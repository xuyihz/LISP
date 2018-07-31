; Divide an Angle equally and draw rays
; 
; Xu Yi, 2018

(defun C:ap() ; defun : Defines a function

    (command "clayer" "0")
    (setq osmode_backup (getvar "osmode")) ; osmode : 设置执行的对象捕捉模式
    ; 输入圆心及两端点
    (setq Vertex (getpoint "\nselect the vertex of an angle")) ; setq : Sets the value of a symbol or symbols to associated expressions
                                        ; (setq sym expr [sym expr]...) 
                                        ; getpoint : Pauses for user input of a point, and returns that point
                                        ; (getpoint [pt] [msg])
    (setq p_Ray1 (getpoint "\nselect point on Ray 1 (Counterclockwise)"))
    (command "RAY" Vertex p_Ray1 "") ; 画射线
    (setq p_Ray2 (getpoint "\nselect point on Ray 2"))
    (command "RAY" Vertex p_Ray2 "") ; 画射线
    (setq angle_p_Ray1 (angle Vertex p_Ray1)) ; angle : Returns an angle in radians of a line defined by two endpoints
    (setq angle_p_Ray2 (angle Vertex p_Ray2))

    (setq angle_num (getint "\nhow many angles do you want? integer only:\n")) ; Pauses for user input of an integer, and returns that integer
                                                                               ; (getint [msg])
    (setq angle_R1R2 (- angle_p_Ray2 angle_p_Ray1)) ; 角度
    (setq angle_unit (/ angle_R1R2 angle_num)) ; 等分的角度
    
    (setvar "osmode" 0)                    ; 0 : 无
    (setq angle_temp angle_p_Ray1) ; 初始化
    (setq repeat_num (- angle_num 1))
    (repeat repeat_num ; repeat : Evaluates each expression a specified number of times, and returns the value of the last expression
                ; (repeat int [expr...])
        (setq angle_temp (+ angle_temp angle_unit))
        (setq p_unit (polar Vertex angle_temp 100)) ; polar : Returns the UCS 3D point at a specified angle and distance from a point
                                                    ; (polar pt ang dist)
        (command "RAY" Vertex p_unit "") ; 画射线
    )
    (setvar "osmode" osmode_backup)
)

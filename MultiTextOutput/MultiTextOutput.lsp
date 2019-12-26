; Output Multiple Texts
; 
; Xu Yi, 2019

(defun C:mto() ; defun : Defines a function

    (setq f (open "C:/1.txt" "w")) ; 生成txt并打开
    ; 
    (setq ss1 "1")
    (while(/= ss1 "9999")
        (setq ss1 (ssget) ;
        (write-line ss1 f) ; 插入内容
        (write-line "\n" f) ; 插入回车
    )
    (close f) ; 关闭文件

)

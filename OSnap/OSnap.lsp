; Backup & Restore OSNAP
; 
; Xu Yi, 2018

(defun C:bzb() ; defun : Defines a function ; Backup

    (setq osmode_backup (getvar "osmode")) ; osmode : 设置执行的对象捕捉模式
    (setq file_path "C:\\Program Files\\Autodesk\\AutoCAD Backups\\OSMODE.txt")
    (setq file (open file_path "w")) ; Opens a file for access by the AutoLISP I/O functions
                                     ; (open filename mode)
    (write-line (ITOA osmode_backup) file) ; Writes a string to the screen or to an open file
                                           ; (write-line string [file-desc])
                                           ; Returns the conversion of an integer into a string
                                           ; (itoa int) 
    (close file) ; Closes an open file
                 ; (close file-desc) 

)

(defun C:bzr() ; defun : Defines a function ; Restore

    (setq file_path "C:\\Program Files\\Autodesk\\AutoCAD Backups\\OSMODE.txt")
    (setq file (open file_path "r"))
    (setq osmode_temp (read-line file)) ; Reads a string from the keyboard or from an open file, until an end-of-line marker is encountered
                                        ; (read-line [file-desc]) 
    (setq osmode_backup (ATOI osmode_temp)) ; Converts a string into an integer
                                            ; (atoi string)
    (setvar "osmode" osmode_backup)

)

(defun C:bz() ; defun : Defines a function ; Restore

    (setvar "osmode" osmode_backup)
    
)

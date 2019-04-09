(defun c:AuP()

    (setvar "cmdecho" 0)
    (dictremove (namedobjdict) "ACAD_DGNLINESTYLECOMP")
    (command "_.qsave")
    (command "_audit" "y")
    (command "_purge" "all" "" "n")
    (command "_.qsave")
    (setvar "cmdecho" 1)
    (princ)

)
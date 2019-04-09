;;;; 姜雄 2016-06-15 星期三 天气晴

(defun c:70(  )  ;;;20厚多段线
(princ"\n请选择直线")
(setq ss(ssget '((0 . "LINE")))n(sslength ss)m 0)
(while(< m n)
(setq a(ssname ss m)m(1+ m)
e(entget a)
p1(cdr(assoc 10 e))
p2(cdr(assoc 11 e))
p3(list 10(car p1)(cadr p1))
p4(list 10(car p2)(cadr p2))
)
(setq laname (cdr (assoc 8 e)))
(entmake (list '(0 . "LWPOLYLINE") '(100 . "AcDbEntity") '(100 . "AcDbPolyline") (cons 8 laname)(cons 90 2)(cons 43 50)  p3  p4))
(entdel a))
)




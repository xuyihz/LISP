;;;; ���� 2015-12-15 ���ڶ� ������ 
;;;;�����У���ע����λ
;;;; 200LJZYWYY YYΪ�̶���׺��LJZYW�������У���ע����λ  

;;;�д������⣬һ�Ƕ�����б�ģ����Ƕ��ڷ����

;;;ѡ���������ٿ���  
(defun C:301( / #k %k i gr n pt  first lst)
(SETVAR "CMDECHO" 0)
(setq #k "1";��������
       %k T  ;ѭ������
       i nil ;��ʼ����
)
 

;;; ѡ������ؼ��б�ע 
(setq sel0 (ssget  '((0 . "TEXT"))))
(setq first  (ssname sel0 0))
(setq lst (entget first))
(setq old1 (cdr (assoc 11 lst))) ;;; �õ�����
(setq old1x (car old1)) ;;; �õ�X����
(setq old1y (cadr old1)) ;;; �õ�y����
(setq old1z (caddr old1)) ;;; �õ�z����
(setq angle1 (cdr (assoc 50 lst))) ;;; �õ���ת�Ƕ�
(setq duiqi (cdr (assoc 73 lst))) ;;; �õ����뷽ʽ
(setq Px (cadr (assoc 11 lst))) ;;; �õ�X����
(setq Py (caddr (assoc 11 lst))) ;;; �õ�y����
(setq bb (sslength  sel0)) 



(setq t1 (/ PI 4))
(setq t2 (* t1 3))
(setq t3 (* t1 5))
(setq t4 (* t1 7))
(setq t0 (/ PI 2))

 













;;;��ȡ��Ҫ�ƶ�����λ����Ϣ

(setq first  (ssname sel0 0)) 
(setq lst (entget first))
(setq Plist (cdr (assoc 11 lst)) )
(setq ii 1)
(repeat  (- bb 1)
(progn  
(setq first  (ssname sel0 ii)) 
(setq lst (entget first))
(setq Plist (append Plist (cdr (assoc 11 lst))))
)
(setq ii (+ ii 1))
) 



;;;ѡ����Ҫ�ƶ�����
;;;�������ֶ����ж����߷���
(prompt "ѡ������") 0
(if  (or  (and (>= angle1 t1) (<= angle1 t2))  (and (>= angle1 t3) (<= angle1 t4))  )
(setq sel2 (ssget ":S"  '((0 . "LINE")(8 . "S-BEAM-Y")) ))
(setq sel2 (ssget ":S"  '((0 . "LINE")(8 . "S-BEAM-X")) ))
)

(prompt "h391") 
(setq cc (sslength  sel2))
(setq first  (ssname sel2 0))  
(setq lst (entget first))
(setq Px1 (cadr (assoc 10 lst)))
(setq Py1 (caddr (assoc 10 lst)))
(setq Px2 (cadr (assoc 11 lst)))
(setq Py2 (caddr (assoc 11 lst)))

   




(setq tag 0)  


(while %k  
(setq  gr (grread t 4 0);;ȡ��������������
n (car gr)       ;;������
pt (cadr gr)     ;;�������
)


(if (= n 5)

(if (= tag 0) ;;;******
(progn   ;;
(setq pt0 pt
tag 1
)

)
(progn
(setq deltax (- (car pt) (car pt0))) 
(setq deltay (- (cadr pt) (cadr pt0)))


(setq ii 0) 
(repeat bb  ;;;****;;û�в��� 
(setq first  (ssname sel0 ii)) 
(setq lst (entget first))
(setq nn (* 3 ii )) 
(setq old1x (nth nn  Plist)) 
(setq old1y (nth (+ nn 1) Plist)) 
(setq old1z (nth (+ nn 2) Plist))
(setq newpt (list (+ old1x deltax) (+ old1y deltay) old1z))  
(setq new1 (cons 11 newpt))
(setq lst (subst new1 (assoc 11 lst) lst))
(entmod lst)
(setq ii (+ ii 1))
)


(setq cos1 (cos angle1) )
(setq cos2 (sin angle1) )
(setq l1 (* deltax cos1))
(setq l2 (* deltay cos2))

(setq sin1(* -1 (sin angle1)) )
(setq sin2 (cos angle1) )
(setq l3 (* deltax sin1))
(setq l4 (* deltay sin2))

 

(setq l5 (* dx sin1))
(setq l6 (* dy sin2))

(setq l (+ l1 l2)) 
(setq d1 (+ l3 l4))
(setq d2 (+ l5 l6)) 


(setq d3 (+ d1 d2)) 
(setq a1 (* d2 d3)) ;;;�ж��Ƿ���뵽����һ������


(setq deltax2 (* l cos1)) ;;; �õ����ƫ��x����
(setq deltay2 (* l cos2)) ;;; �õ����ƫ��y����
(setq first  (ssname sel2 0))  
(setq lst (entget first)) 



(setq newP1 (list (+ Px1 deltax2) (+ Py1 deltay2)))

(if (>= d2 0) (setq DD1 (*  (- (* bb 352.75 ) 52.75) sin1)) 
              (setq DD1 (*  (- (* bb -352.75 ) -52.75) sin1)))
(if (>= d2 0) (setq DD2 (*  (- (* bb 352.75 ) 52.75) sin2)) 
              (setq DD2 (*  (- (* bb -352.75 ) -52.75) sin2)))              



(if (>= a1 0) (setq newP2 (list (+ Px2 deltax) (+ Py2 deltay))) 
              (setq newP2 (list (- (+ Px2 deltax) DD1) (- (+ Py2 deltay) DD2)) ) )


(setq new1 (cons 10 newP1))
(setq new2 (cons 11 newP2))
(setq lst (subst new1 (assoc 10 lst) lst))
(setq lst (subst new2 (assoc 11 lst) lst))
(entmod lst) 


) 
) 
)  

(if (= n 3) (setq %k nil) );;3��ʾ���;����ѭ��

(if (or (= n 2) (= n 25));;2��ʾ�ո�;25��ʾ�Ҽ�;����ѭ����ɾ������
(setq %k nil)
)


)



(SETVAR "CMDECHO" 1)
)

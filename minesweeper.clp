;;;***************************
;;;* DEFTEMPLATE DEFINITIONS *
;;;***************************

(deftemplate rule 
	(multislot if)
	(multislot then))

(deftemplate opened
	(slot row)
	(slot column)
	(slot value)
	(slot bombs))

(deftemplate safe-cell
	(slot row)
	(slot column))

(deftemplate mark-bomb
	(slot row)
	(slot column))

; ********************
; DEFFUNCTION ADJACENTS
; ********************
(deffuntion adjacent-up 
	(?r ?c) 
	(return 
		(create$ (+ ?r 1) ?c)
	)
)

(deffuntion adjacent-up-right 
	(?r ?c) 
	(return 
		(create$ (+ ?r 1) (+ ?c 1))
	)
)

(deffuntion adjacent-right 
	(?r ?c) 
	(return 
		(create$ ?r (+ ?c 1))
	)
)

(deffuntion adjacent-down-right 
	(?r ?c) 
	(return 
		(create$ (- ?r 1) (+ ?c 1))
	)
)

(deffuntion adjacent-down 
	(?r ?c) 
	(return 
		(create$ (- ?r 1) ?c)
	)
)

(deffuntion adjacent-down-left 
	(?r ?c) 
	(return 
		(create$ (- ?r 1) (- ?c 1))
	)
)

(deffuntion adjacent-left 
	(?r ?c) 
	(return 
		(create$ ?r (- ?c 1))
	)
)

(deffuntion adjacent-up-left 
	(?r ?c) 
	(return 
		(create$ (+ ?r 1) (- ?c 1))
	)
)

; *****************************
; DEFFUNCTION POSSIBLE
; *****************************
(deffuntion possible
	(row ?r column ?c value ?v bombs ?b)
	(not (opened (?r ?c ?v ?b)))
	(not (mark-bomb (?r ?c)))
	(not (mark-safe (?r ?c)))
)

; (defrule propagate-goal ""
;    (goal is ?goal)
;    (rule (if ?variable $?)
;          (then ?goal ? ?value))
;    =>
;    (assert (goal is ?variable)))

; (defrule goal-satified ""
;    (declare (salience 30))
;    ?f <- (goal is ?goal)
;    (variable ?goal ?value)
;    (answer ? ?text ?goal)
;    =>
;    (retract ?f)
;    (format t "%s%s%n" ?text ?value))


(defrule check00
	; (declare (salience ))
	(phase start-game)
	=>
	(assert (safe-cell (row 0) (column 0))
		(phase open)
		(not (possible (row 0) (column 0)))
	)
)

; all bombs around current cell have already been found
(defrule check-first-condition
	(phase checking)
	(possible (row ?r) (column ?c) (value ?v) (bombs ?b))
	(test (= (?v ?b)))

	=>
	(if (possible (nth$ 1 (adjacent-up (?r ?c))) nth$ 2 (adjacent-up (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-up (?r ?c))) nth$ 2 (adjacent-up (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-up-right (?r ?c))) nth$ 2 (adjacent-up-right (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-up-right (?r ?c))) nth$ 2 (adjacent-up-right (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-right (?r ?c))) nth$ 2 (adjacent-right (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-right (?r ?c))) nth$ 2 (adjacent-right (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-down-right (?r ?c))) nth$ 2 (adjacent-down-right (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-down-right (?r ?c))) nth$ 2 (adjacent-down-right (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-down (?r ?c))) nth$ 2 (adjacent-down (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-down (?r ?c))) nth$ 2 (adjacent-down (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-down-left (?r ?c))) nth$ 2 (adjacent-down-left (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-down-left (?r ?c))) nth$ 2 (adjacent-down-left (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-left (?r ?c))) nth$ 2 (adjacent-left (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-left (?r ?c))) nth$ 2 (adjacent-left (?r ?c)))))
    )
	(if (possible (nth$ 1 (adjacent-up-left (?r ?c))) nth$ 2 (adjacent-up-left (?r ?c))) (value any) (bombs any)))
      then 
      (assert safe-cell(nth$ 1 (adjacent-up-left (?r ?c))) nth$ 2 (adjacent-up-left (?r ?c)))))
    )
)

; Not all bombs around current cell have already been found
(defrule check-second-condition
	(phase checking)
	(possible (row ?r) (column ?c) (value ?v) (bombs ?b))
	(test (= (?v ?b)))
	
	=>(if )

)
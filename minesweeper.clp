;;;***************************
;;;* DEFTEMPLATE DEFINITIONS *
;;;***************************

(
	deftemplate rule 
		(multislot if)
		(multislot then)
)

(
	deftemplate possible
		(slot row)
		(slot column)
)

(
	deftemplate opened
		(slot row)
		(slot column)
		(slot value)
		(slot bombs)
		(slot n_possible)
)

(
	deftemplate safe-cell
		(slot row)
		(slot column))

(
	deftemplate mark-bomb
		(slot row)
		(slot column)
)

; ********************
; DEFFUNCTION ADJACENTS
; ********************
(deffunction adjacent-up 
	(?r ?c) 
	(return 
		(create$ (+ ?r 1) ?c)
	)
)

(deffunction adjacent-up-right 
	(?r ?c) 
	(return 
		(create$ (+ ?r 1) (+ ?c 1))
	)
)

(deffunction adjacent-right 
	(?r ?c) 
	(return 
		(create$ ?r (+ ?c 1))
	)
)

(deffunction adjacent-down-right 
	(?r ?c) 
	(return 
		(create$ (- ?r 1) (+ ?c 1))
	)
)

(deffunction adjacent-down 
	(?r ?c) 
	(return 
		(create$ (- ?r 1) ?c)
	)
)

(deffunction adjacent-down-left 
	(?r ?c) 
	(return 
		(create$ (- ?r 1) (- ?c 1))
	)
)

(deffunction adjacent-left 
	(?r ?c) 
	(return 
		(create$ ?r (- ?c 1))
	)
)

(deffunction adjacent-up-left 
	(?r ?c) 
	(return 
		(create$ (+ ?r 1) (- ?c 1))
	)
)

; *****************************
; DEFRULES
; *****************************

(
	defrule start-game
		(phase start-game)
		=>
		(
			assert (
				safe-cell 
				(row 0) 
				(column 0)
				)

				(phase open)
				)
			(retract phase start-game)
		)
)

; all bombs around current cell have already been found
(defrule check-first-condition
	(phase checking)
	(opened 
		(row ?r) 
		(column ?c) 
		(value ?v) 
		(bombs ?b)
		(n_possible ?n)
	)
	(test 
		(= 
			(?v ?b)
		)
	)
	(> ?n 0)
	=>

	(if 
		(possible 
			(nth$ 1 
				(adjacent-up 
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-up 
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-up 
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-up 
							(?r ?c)
						)
					)
				)
				(phase open)
			)
	)
	(if 
		(possible 
			(nth$ 1 
				(adjacent-up-right 
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-up-right 
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-up-right 
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-up-right 
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
   (if 
		(possible 
			(nth$ 1 
				(adjacent-right 
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-right 
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-right 
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-right 
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
	(if 
		(possible 
			(nth$ 1 
				(adjacent-down-right
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-down-right
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-down-right
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-down-right
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
   (if 
		(possible 
			(nth$ 1 
				(adjacent-down
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-down
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-down
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-down
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
   (if 
		(possible 
			(nth$ 1 
				(adjacent-down-left
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-down-left
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-down-left
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-down-left
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
   (if 
		(possible 
			(nth$ 1 
				(adjacent-left 
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-left 
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-left 
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-left 
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
   (if 
		(possible 
			(nth$ 1 
				(adjacent-up-left
					(?r ?c)
				)
			) 
			(nth$ 2 
				(adjacent-up-left
					(?r ?c)
				)
			)
		) then 
      		(assert 
				(safe-cell
					(nth$ 1 
						(adjacent-up-left
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-up-left
							(?r ?c)
						)
					)
				)
				(phase open)
			)
   )
)

; bombs < value
(defrule check-second-condition
	(phase checking)
	(opened 
		(row ?r) 
		(column ?c) 
		(value ?v) 
		(bombs ?b)
		(n_possible ?n)
	)
	(test 
		( > 
			(?v ?b)
		)
	)
	(> ?n 0)
	=>
	(if 
		(= ?n_possible
			(- ?v ?b)	
		) then
			(if 
				(possible 
					(nth$ 1 
						(adjacent-up
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-up
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-up
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-up
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-up-right
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-up-right
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-up-right
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-up-right
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-right
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-right
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-right
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-right
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-down-right
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-down-right
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-down-right
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-down-right
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-down
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-down
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-down
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-down
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-down-left
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-down-left
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-down-left
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-down-left
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-left
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-left
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-left
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-left
									(?r ?c)
								)
							)
						)
					)
			)
			(if 
				(possible 
					(nth$ 1 
						(adjacent-up-left
							(?r ?c)
						)
					) 
					(nth$ 2 
						(adjacent-up-left
							(?r ?c)
						)
					)
				) then 
					(assert 
						(mark-bomb
							(nth$ 1 
								(adjacent-up-left
									(?r ?c)
								)
							) 
							(nth$ 2 
								(adjacent-up-left
									(?r ?c)
								)
							)
						)
					)
			)
	)

)

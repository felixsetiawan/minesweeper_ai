;;;***************************
;;;* DEFTEMPLATE DEFINITIONS *
;;;***************************

(deftemplate rule 
	(multislot if)
	(multislot then))

(defrule propagate-goal ""
	(goal is ?goal)
)
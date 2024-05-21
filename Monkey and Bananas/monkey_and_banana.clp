(deffacts initial-state
    (steps (create$ monkey-sees-banana))
    (monkey on-floor)
    (monkey hungry)
    (monkey far-from-chair)
    (monkey far-from-desk)
    (banana hanging-from-ceiling)
    (banana unpeeled)
    (chair on-floor)
    (chair far-from-desk)
    (chair is-light)
    (desk on-floor)
    (desk not-under banana)
    (desk is-heavy)
)

(defrule monkey-eats-banana
    ?trash1 <- (banana is-peeled)
    ?trash2 <- (monkey with-banana)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey eats-banana))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-eats-banana)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?trash2)
    (retract ?steps)
)

(defrule monkey-climbs-on-desk
    (chair on-desk)
    ?trash1 <- (monkey on-floor)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey on-desk))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-climbs-on-desk)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?steps)
)

(defrule monkey-goes-to-chair
    (monkey on-floor)
    (chair on-floor)
    (desk under banana)
    (monkey far-from-desk)
    ?trash1 <- (monkey far-from-chair)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey near-chair))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-goes-to-chair)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?steps)
)

(defrule monkey-peels-banana
    (monkey with-banana)
    ?trash1 <- (banana unpeeled)
    ?steps <- (steps ?plan)
    =>
    (assert (banana is-peeled))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-peels-banana)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?steps)
)

(defrule monkey-is-happy
    ?trash1 <- (monkey eats-banana)
    ?trash2 <- (monkey hungry)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey is-happy))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-is-happy)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?trash2)
    (retract ?steps)
)

(defrule monkey-goes-to-desk
    (monkey on-floor)
    (desk on-floor)
    (banana hanging-from-ceiling)
    (desk not-under banana)
    ?trash1 <- (monkey far-from-desk)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey near-desk))
    (bind ?new-step (create$ monkey-goes-to-desk))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?steps)
)

(defrule monkey-lifts-desk-under-banana
    (monkey near-desk)
    ?trash1 <- (desk not-under banana)
    (desk is-light)
    ?steps <- (steps ?plan)
    =>
    (assert (desk under banana))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-lifts-desk-under-banana)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?steps)
)

(defrule monkey-drags-desk-under-banana
    (monkey near-desk)
    ?trash1 <- (desk not-under banana)
    (desk is-heavy)
    ?steps <- (steps ?plan)
    =>
    (assert (desk under banana))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-drags-desk-under-banana)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?steps)
)

(defrule monkey-goes-to-desk-with-chair
    (monkey with-chair)
    ?trash1 <- (monkey far-from-desk)
    ?trash2 <- (chair far-from-desk)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey near-desk))
    (assert (chair near-desk))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-goes-to-desk-with-chair)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?trash2)
    (retract ?steps)
)

(defrule monkey-lifts-chair
    ?trash1 <- (monkey near-chair)
    (chair is-light)
    ?trash2 <- (chair on-floor)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey with-chair))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-lifts-chair)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?trash2)
    (retract ?steps)
)

(defrule monkey-grabs-banana
    ?trash1 <- (monkey reaches banana)
    ?trash2 <- (banana hanging-from-ceiling)
    ?steps <- (steps ?plan)
    =>
    (assert (monkey with-banana))
    (bind ?new-step (create$ (str-cat ?plan " " monkey-grabs-banana)))
    (assert (steps ?new-step))
    (retract ?trash1)
    (retract ?trash2)
    (retract ?steps)
)

(defrule print-plan
    (steps ?plan)
    =>
    (printout t ?plan crlf)
    (facts)
)

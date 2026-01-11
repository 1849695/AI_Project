;;The rover must collect a sample while avoiding obstacles and managing energy.

(define (problem space_rover_p2)
  (:domain space_rover)
  (:objects
    rover1 - rover
    loc1 loc2 loc3 loc4  loc5 - location
    sample1 - sample
  )
  (:init
    (at rover1 loc1)
    (connected loc1 loc2)
    (connected loc2 loc3)
    (connected loc3 loc4)
    (connected loc4 loc5)
    (sample-at sample1 loc5)
    (obstacle loc4)  ; Rover must take a detour
    (energy-high rover1)  ; Start with full energy
    (sunny loc3)
    (sunny loc5)
  )
  (:goal (and (has-sample rover1 sample1) (at rover1 loc1)))
)


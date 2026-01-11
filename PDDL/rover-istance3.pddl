;;The rover must collect two samples, recharge, and return to base.

(define (problem space_rover_p3)
  (:domain space_rover)
  (:objects
    rover2 rover1 - rover
    loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 - location
    sample1 sample2 sample3 - sample
  )
  (:init
    (at rover2 loc6)
    (at rover1 loc1)
    (connected loc1 loc2)
    (connected loc2 loc3)
    (connected loc3 loc4)
    (connected loc3 loc5)
    (connected loc3 loc6)
    (connected loc4 loc5)
    (connected loc6 loc7)
    (connected loc7 loc5)
    (connected loc5 loc8)
    (sample-at sample1 loc4)
    (sample-at sample2 loc7)
    (sample-at sample3 loc8)
    (obstacle loc2) 
    (obstacle loc4)
    (obstacle loc5)
    (energy-high rover2)
    (energy-high rover1)  ; Start with full energy
    (sunny loc3)
    (sunny loc8)
    (sunny loc7)
  )
  (:goal (and (has-sample rover1 sample1) (has-sample rover1 sample2) (has-sample rover2 sample3) (at rover1 loc1) (at rover2 loc6)))
)


;;The rover moves to a goal while managing energy consumption.

(define (problem space_rover_p1)
  (:domain space_rover)
  (:objects
    rover1 - rover
    loc1 loc2 loc3 loc4 solar1 - location
    sample1 - sample  ; Explicitly declare sample
  )
  (:init
    (at rover1 loc1)
    (connected loc1 loc2)
    (connected loc2 loc3)
    (connected loc3 loc4)
    (sample-at sample1 loc2)  ; Ensure sample is placed
    (energy-high rover1)  
    (sunny loc3)  
  )
  (:goal (and (has-sample rover1 sample1) (at rover1 loc4)))
)



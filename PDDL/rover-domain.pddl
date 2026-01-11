(define (domain space_rover)
  (:requirements :strips :typing :adl)
  (:types rover location sample)  

  (:predicates
    (at ?r - rover ?l - location)
    (connected ?l1 ?l2 - location)
    (energy-empty ?r - rover)  ; Rover has no energy left
    (energy-low ?r - rover)    
    (energy-medium ?r - rover)  
    (energy-high ?r - rover)    
    (has-sample ?r - rover ?s - sample)  
    (sample-at ?s - sample ?l - location)  
    (obstacle ?l - location)
    (sunny ?l - location)  ; Locations where the rover can recharge via solar panels
  )

  (:action move
    :parameters (?r - rover ?from - location ?to - location)
    :precondition (and 
      (at ?r ?from) 
      (or (connected ?from ?to) (connected ?to ?from))
      (not (obstacle ?to)) 
      (or (energy-high ?r) (energy-medium ?r) (energy-low ?r))  
    )
    :effect (and 
      (not (at ?r ?from)) 
      (at ?r ?to) 
      (when (energy-high ?r) (and (not (energy-high ?r)) (energy-medium ?r)))  
      (when (energy-medium ?r) (and (not (energy-medium ?r)) (energy-low ?r)))  
      (when (energy-low ?r) (and (not (energy-low ?r)) (energy-empty ?r)))  ; New effect: Low → Empty
    )
  )
  
  (:action collect-sample
    :parameters (?r - rover ?s - sample ?l - location)
    :precondition (and 
      (at ?r ?l) 
      (sample-at ?s ?l) 
      (or (energy-high ?r) (energy-medium ?r) (energy-low ?r))
    )
    :effect (and 
      (not (sample-at ?s ?l)) 
      (has-sample ?r ?s)
      (when (energy-high ?r) (and (not (energy-high ?r)) (energy-medium ?r)))  
      (when (energy-medium ?r) (and (not (energy-medium ?r)) (energy-low ?r)))  
      (when (energy-low ?r) (and (not (energy-low ?r)) (energy-empty ?r)))  ; New effect: Low → Empty
    )
  )

  (:action solar-recharge
    :parameters (?r - rover ?l - location)
    :precondition (and 
      (at ?r ?l) 
      (sunny ?l)  ; The rover can only recharge where it is sunny
    )
    :effect (and 
      (not (energy-low ?r)) (not (energy-medium ?r)) (not (energy-empty ?r))  
      (energy-high ?r)  ; Fully recharges
    )
  )

  (:action destroy-with-laser
    :parameters (?r - rover ?l - location ?o - location)
    :precondition (and 
      (at ?r ?l)
      (or (connected ?l ?o) (connected ?o ?l))  
      (obstacle ?o)
      (or (energy-high ?r) (energy-medium ?r) (energy-low ?r))  
    )
    :effect (and 
      (not (obstacle ?o))  
      (when (energy-high ?r) (and (not (energy-high ?r)) (energy-medium ?r)))  
      (when (energy-medium ?r) (and (not (energy-medium ?r)) (energy-low ?r)))  
      (when (energy-low ?r) (and (not (energy-low ?r)) (energy-empty ?r)))  ; New effect: Low → Empty
    )
  )
)

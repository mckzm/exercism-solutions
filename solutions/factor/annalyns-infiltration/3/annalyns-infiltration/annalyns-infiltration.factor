USING: kernel ;
IN: annalyns-infiltration

: and-not? ( x y -- ? )
    swap not and ;

: can-do-fast-attack ( knight-awake -- ? )
    not ;

: can-spy ( knight-awake archer-awake prisoner-awake -- ? )
    or or ;

: can-signal-prisoner ( archer-awake prisoner-awake -- ? )
    and-not? ;

: can-free-prisoner ( archer-awake dog-present prisoner-awake knight-awake -- ? )
    not and or and-not? ;

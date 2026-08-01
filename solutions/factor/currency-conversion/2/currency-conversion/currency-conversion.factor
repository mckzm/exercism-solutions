USING: kernel math math.functions math.order ;
IN: currency-conversion

: exchange-money ( budget exchange-rate -- exchanged )
    / ;

: get-change ( budget exchanging-value -- change )
    - ;

: value-of-bills ( denomination number-of-bills -- value )
    * ;

: number-of-bills ( amount denomination -- bills )
    / floor >integer ;

: leftover-of-bills ( amount denomination -- leftover )
    mod ;

: total-exchange-rate ( spread exchange-rate -- exchange-rate-plus-commission )
    swap 100 /f dupd * + ;

: exchangeable-value ( denomination budget spread exchange-rate -- value )
    total-exchange-rate exchange-money dupd swap number-of-bills value-of-bills ;

: safe-change ( budget exchanging-value -- change )
    get-change 0 max ;

: cap-spend ( budget price -- spend )
    min ;

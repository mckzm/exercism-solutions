USING: kernel math ;
IN: lasagna

! Define expected-bake-time (in min)
CONSTANT: expected-bake-time 40
CONSTANT: minutes-per-layer 2

: preparation-time ( layers -- minutes )
    minutes-per-layer * ;

: remaining-time ( current-time -- remaining )
    expected-bake-time swap - ;

: total-working-time ( layers current-time -- minutes )
    swap preparation-time + ;

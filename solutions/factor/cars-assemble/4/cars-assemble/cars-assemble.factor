USING: combinators kernel math math.order ;
IN: cars-assemble

CONSTANT: base-speed 221

: production-status ( speed -- status )
    zero? [ "stopped" ] [ "running" ] if ;

: success-rate ( speed -- rate )
    {
        { [ dup zero?  ] [ drop 0.0 ] }
        { [ dup 1 4 between?  ] [ drop 1.0 ] }
        { [ dup 5 8 between?  ] [ drop 0.9 ] }
        { [ dup 9 =  ] [ drop 0.8 ] }
        { [ 10 =  ] [ 0.77 ] }
    } cond ;

: production-rate-per-hour ( speed -- rate )
   [ base-speed * ] [ success-rate ] bi * ;

: working-items-per-minute ( speed -- count )
    production-rate-per-hour 60 /i ;

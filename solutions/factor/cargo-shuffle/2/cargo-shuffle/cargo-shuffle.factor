USING: kernel ;
IN: cargo-shuffle

ALIAS: swap-crates swap
ALIAS: clear-spill drop
ALIAS: peek-under over

: tidy-deck ( x y z -- z z y )
    rot drop dup rot ;

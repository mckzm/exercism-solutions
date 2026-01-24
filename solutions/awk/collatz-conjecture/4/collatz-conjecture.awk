function collatzize(n) {
    return (n % 2 == 0) ? (n / 2) : (n * 3) + 1;
}

function stepsToOne(n, count) {
    if (n <= 0) {
        print "Error: Only positive numbers are allowed";
        exit 1;
    }
    if (n == 1) return count;

    return stepsToOne(collatzize(n), ++count);
}

{ steps = stepsToOne($0, 0); }

END { print steps; }



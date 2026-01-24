function collatzize(n) {
    return (n % 2 == 0) ? (n / 2) : (n * 3) + 1;
}

function stepsToOne(n, count) {
    if (n == 1) return count;
    return stepsToOne(collatzize(n), ++count);
}

$0 <= 0 {
    print "Error: Only positive numbers are allowed" > "/dev/stderr";
    exit 1;
}
{ steps = stepsToOne($0, 0); }

END { print steps; }

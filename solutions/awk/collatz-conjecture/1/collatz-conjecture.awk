function stepsToOne(n, count) {
    if (n <= 0) {
        print "Error: Only positive numbers are allowed";
        exit 1;
    }


    if (n == 1) return count;

    if (n % 2 == 0) {
        n /= 2;
    } else {
        n = (n * 3) + 1;
    }

    return stepsToOne(n, ++count);
}

{ steps = stepsToOne($0, 0); }

END {
    print steps;
}



package CryptoSquare;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

sub cipher ($text) {
    my $alnum = normalise($text);
    return q() unless $alnum;

    my ($rect, $rows, $cols) = rectangularise($alnum);
    my @rotated = rotate($rect, $rows, $cols);

    return join(' ', @rotated);
}

sub normalise ($text) {
    $text =~ s/[[:^alnum:]]//g;
    return lc($text);
}

sub rectangularise($text) {
    my $len = length($text);
    my $cols = my $rows = int(sqrt($len));

    while ($cols * $rows < $len) {
        $cols++;
        $rows++ if ($cols * $rows < $len);
    }
    my @rect = $text =~ /(.{1, $cols})/g;

    return (\@rect, $rows, $cols);
}

sub rotate($rect, $rows, $cols) {
    my @aoa = map {[split(//, $_)]} @$rect;
    my @rotated;

    foreach my $rr (0..($cols - 1)) {
        my $s = q();
        foreach my $ori (@aoa) {
            $s .= $ori->[$rr] ? $ori->[$rr] : ' ';
        }
        push(@rotated, $s);
    }

    return @rotated;
}


1;

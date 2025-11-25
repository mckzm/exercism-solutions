package Allergies;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

our @allergens = qw(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats);

sub allergic_to ( $item, $score ) {
    my ($exponent) = grep { $allergens[$_] eq $item } (0..@allergens - 1);
    return ($score & (1 << $exponent));
}

sub list_allergies ($score) {
    my @allergies;

    for my $allergen (@allergens) {
      if (allergic_to($allergen, $score)) {
        push(@allergies, $allergen);
      }
    }

    return \@allergies;
}

1;

#`[
    Declare role 'Bob' and unit-scope the role
    i.e. everything in this file is part of 'Bob'.
]
unit role Bob;

method hey () {
    my $trimmed = self.trim;
    my $is_silence = $trimmed eq '';
    my $is_question = so $trimmed ~~ / '?'$/;
    my $is_yelling = $trimmed.uc eq $trimmed && $trimmed.lc ne $trimmed;

    return "Calm down, I know what I'm doing!" if $is_yelling && $is_question;
    return "Whoa, chill out!" if $is_yelling;
    return "Sure." if $is_question;
    return "Fine. Be that way!" if $is_silence;
    return "Whatever.";
}

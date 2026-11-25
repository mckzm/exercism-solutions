#`[
    Declare role 'Bob' and unit-scope the role
    i.e. everything in this file is part of 'Bob'.
]
unit role Bob;

method hey () {
    my $trimmed = self.trim;

    return "Fine. Be that way!" if $trimmed eq '';
    
    my $is_question = $trimmed.ends-with('?');
    my $is_yelling = $trimmed.contains(any('A'..'Z') & none('a'..'z'));
    my $is_yelling_question = $is_yelling && $is_question;

    return "Calm down, I know what I'm doing!" if $is_yelling_question;
    return "Whoa, chill out!" if $is_yelling;
    return "Sure." if $is_question;
    return "Whatever.";
}

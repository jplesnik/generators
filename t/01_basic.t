use strict;
use warnings;
use Test::More tests => 21;
use Test::Simple;

my $files    = "t/data/basic t/data/whitespace";
my @requires = qx(bin/perl.req $files);
my @provides = qx(bin/perl.prov $files);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Non-versioned modules requires
my @list_requires = ( "Alpha::One", "Alpha::Two", "Beta", "Gamma",
    "Epsilon", "Eta", "Theta", "Iota", "Kappa", "Lambda");

foreach my $mod (@list_requires) {
    ok(grep(/^perl\($mod\)$/,@requires), "'$mod' is required")
}

#
# Versioned modules
ok(grep(/^perl\(Alpha\) >= 0.12$/, @requires), "'perl(Alpha) >= 0.12' is required");

# Perl version
foreach my $v ('1:5.6.1', '0:5.006_001', '1:5.010') {
    ok(grep(/^perl >= $v$/, @requires), "'perl >= $v' is required");
}

# Should not be listed
ok(!grep(/^perl\(Alpha\)$/, @requires), "Unversion 'perl(Alpha)' is not required");

# TODO: Should recognize more than one 'use' or 'require' at one line
ok(!grep(/^perl\(Zeta\)$/, @requires), "'perl(Zeta)' is not required");

# 'use' prefixed by whitespace should be also find 
ok(grep(/^perl\(Use::WhiteSpace\)/, @requires), "'perl(Use::WhiteSpace)' is required");

# TODO: Stop ignoring 'require' with whitespaces at the beginning
ok(!grep(/^perl\(Require::WhiteSpace\)/, @requires), "'perl(Require::WhiteSpace)' is required");

# 'use' does not accept module name with .pm
ok(!grep(/^perl\(Ignore\)/, @requires), "'perl(Ignore)' is not required");

#
# Check if expected amount of modules was found
is(scalar(@requires), scalar(@list_requires) + 5, "Expected amount of modules was found");

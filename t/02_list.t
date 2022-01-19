use strict;
use warnings;
use Test::More tests => 16;

my $file     = "t/data/list";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requiremets to be found
my @found = ("Alpha", "Beta", "Gamma", 'Delta', "Epsilon",
    "Some::Crazy::Module", "Another::Crazy::Module", "aliased", "base",
    "parent"
);
foreach my $mod (@found) {
    ok(grep(/^perl\($mod\)$/,@requires), "'$mod' is required")
}

# Requirements to be ignore
my @ignored = ("Zeta", "Iota", "ShorterName");
foreach my $mod (@ignored) {
    ok(!grep(/^perl\($mod\)$/,@requires), "'$mod' is not required")
}

# TODO: Find multiple line use
ok(!grep(/^perl\(overload\)$/, @requires), "'perl(overload)' is not found");

#
# Check if expected amount of modules was found
is(scalar(@requires), scalar(@requires), "Expected amount of modules was found");

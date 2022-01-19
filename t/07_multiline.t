use strict;
use warnings;
use Test::More tests => 2;

my $file     = "t/data/multiline";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "perl(At::The::End)\n",
    "perl(overload)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

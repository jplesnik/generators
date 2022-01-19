use strict;
use warnings;
use Test::More tests => 2;

my $file     = "t/data/anymoose";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "perl(Any::Moose) >= 0.18\n",
    "perl(Mouse)\n",
    "perl(Mouse::Role)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

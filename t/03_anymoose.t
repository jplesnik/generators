use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my $file     = "t/data/anymoose";
my @requires = qx($PERL_REQ $file);
my @provides = qx($PERL_PROV $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "$perl_ns(Any::Moose) >= 0.18\n",
    "$perl_ns(Mouse)\n",
    "$perl_ns(Mouse::Role)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

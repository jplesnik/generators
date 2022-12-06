use strict;
use warnings;
use Test::More tests => 2;
use Test::Simple;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my $files    = "t/data/basic";
my @requires = qx($PERL_REQ $files);
my @provides = qx($PERL_PROV $files);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "$perl_ns(:VERSION) >= 5.10.0\n",
    "$perl_ns(Alpha) >= 0.12\n",
    "$perl_ns(Alpha::One)\n",
    "$perl_ns(Alpha::Two)\n",
    "$perl_ns(Beta)\n",
    "$perl_ns(Epsilon)\n",
    "$perl_ns(Eta)\n",
    "$perl_ns(ExtUtils::MM_Unix)\n",
    "$perl_ns(Gamma)\n",
    "$perl_ns(Iota)\n",
    "$perl_ns(Kappa)\n",
    "$perl_ns(Lambda)\n",
    "$perl_ns(Replace::Slash::Colon)\n",
    "$perl_ns(Theta)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");


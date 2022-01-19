use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my $file     = "t/data/list";
my @requires = qx($PERL_REQ $file);
my @provides = qx($PERL_PROV $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "$perl_ns(Alpha)\n",
    "$perl_ns(Beta)\n",
    "$perl_ns(Gamma)\n",
    "$perl_ns(Delta)\n",
    "$perl_ns(Epsilon)\n",
    "$perl_ns(Some::Crazy::Module)\n",
    "$perl_ns(Another::Crazy::Module)\n",
    "$perl_ns(aliased)\n",
    "$perl_ns(base)\n",
    "$perl_ns(parent)\n",
    "$perl_ns(Theta)\n",
    "$perl_ns(Kappa::Lambda)\n",
    "$perl_ns(Mu::Nu)\n",
    "$perl_ns(Try)\n",
    "$perl_ns(This)\n",
    "$perl_ns(One)\n",
    "$perl_ns(constant)\n",
    "$perl_ns(TARGET_CLASS)\n",
    "$perl_ns(XML::XQL::Element)\n",
    "$perl_ns(Class::Accessor::Fast)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

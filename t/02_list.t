use strict;
use warnings;
use Test::More tests => 2;

my $file     = "t/data/list";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "perl(Alpha)\n",
    "perl(Beta)\n",
    "perl(Gamma)\n",
    "perl(Delta)\n",
    "perl(Epsilon)\n",
    "perl(Some::Crazy::Module)\n",
    "perl(Another::Crazy::Module)\n",
    "perl(aliased)\n",
    "perl(base)\n",
    "perl(parent)\n",
    "perl(Theta)\n",
    "perl(Kappa::Lambda)\n",
    "perl(Mu::Nu)\n",
    "perl(Try)\n",
    "perl(This)\n",
    "perl(One)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

use strict;
use warnings;
use Test::More tests => 2;
use Test::Simple;

my $files    = "t/data/basic";
my @requires = qx(bin/perl.req $files);
my @provides = qx(bin/perl.prov $files);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
my @expectedrequires = (
    "perl(:VERSION) >= 5.6.1\n",
    "perl(:VERSION) >= 5.6.0\n",
    "perl(:VERSION) >= 5.10.0\n",
    "perl(Alpha) >= 0.12\n",
    "perl(Alpha::One)\n",
    "perl(Alpha::Two)\n",
    "perl(Beta)\n",
    "perl(Epsilon)\n",
    "perl(Eta)\n",
    "perl(ExtUtils::MM_Unix)\n",
    "perl(Gamma)\n",
    "perl(Iota)\n",
    "perl(Kappa)\n",
    "perl(Lambda)\n",
    "perl(Theta)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");


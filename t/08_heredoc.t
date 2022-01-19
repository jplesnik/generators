use strict;
use warnings;
use Test::More tests => 2;

my $file     = "t/data/heredoc";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
my @expectedprovides = (
    "perl(More::Then::Two::Mark)\n",
    "perl(Not::In::Heredoc)\n",
    "perl(THAT)\n",
);

is_deeply([ sort @provides ], [ sort @expectedprovides ], "Only expected provides were found.");

#
# Requires
my @expectedrequires = (
    "perl(Bitwise::Operator)\n",
    "perl(constant)\n",
    "perl(More::Then::Two::Mark)\n",
    "perl(Not::In::Heredoc)\n",
    "perl(THAT)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

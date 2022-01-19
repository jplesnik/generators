use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my $file     = "t/data/heredoc";
my @requires = qx($PERL_REQ $file);
my @provides = qx($PERL_PROV $file);

#
# Provides
my @expectedprovides = (
    "$perl_ns(More::Then::Two::Mark)\n",
    "$perl_ns(Not::In::Heredoc)\n",
    "$perl_ns(THAT)\n",
);

is_deeply([ sort @provides ], [ sort @expectedprovides ], "Only expected provides were found.");

#
# Requires
my @expectedrequires = (
    "$perl_ns(Bitwise::Operator)\n",
    "$perl_ns(constant)\n",
    "$perl_ns(More::Then::Two::Mark)\n",
    "$perl_ns(Not::Hang)\n",
    "$perl_ns(Not::In::Heredoc)\n",
    "$perl_ns(THAT)\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

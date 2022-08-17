use strict;
use warnings;
use Test::More tests => 2;
use Test::Simple;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my $files    = "t/testdata";
my @requires = qx($PERL_REQ $files);
my @provides = qx($PERL_PROV $files);

#
# Provides
my @expectedprovides = (
    "$perl_ns(Test)\n",
    "$perl_ns(TMP::tmp)\n",
);
is_deeply([ sort @provides ], [ sort @expectedprovides ], "Only expected provides were found.");

#
# Requires
my @expectedrequires = (
    "$perl_ns(aliased)\n",
    "$perl_ns(Another::Crazy::Module)\n",
    "$perl_ns(Any::Moose)\n",
    "$perl_ns(base)\n",
    "$perl_ns(Carp)\n",
    "$perl_ns(DBI)\n",
    "$perl_ns(Exporter)\n",
    "$perl_ns(File::Copy)\n",
    "$perl_ns(Meow)\n",
    "$perl_ns(Moose)\n",
    "$perl_ns(Mouse)\n",
    "$perl_ns(parent)\n",
    "$perl_ns(POE)\n",
    "$perl_ns(Require::Begin)\n",
    "$perl_ns(Some::Crazy::Module)\n",
    "$perl_ns(Test::Requires)\n",
    "$perl_ns(Test::Simple)\n",
    "$perl_ns(Use::Begin)\n",
    "$perl_ns(Use::WhiteSpace)\n",
    "$perl_ns(overload)\n",
    "$perl_ns(version) >= 0.77\n",
    "$perl_ns(:VERSION) >= 5.6.1\n",
);

is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only expected requires were found.");

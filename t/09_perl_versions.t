use strict;
use warnings;
use Test::More;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_REQ);

# Each test needs a separate file. Multiple statements in one file are
# squashed into one RPM dependency symbol.
my %tests = (
    'v5.6.1'       =>  "$PERL_NAMESPACE(:VERSION) >= 5.6.1\n",
    '5.006_001'    =>  "$PERL_NAMESPACE(:VERSION) >= 5.6.0\n",
    '5.010'        =>  "$PERL_NAMESPACE(:VERSION) >= 5.10.0\n",
);
plan tests => scalar %tests;

for (sort keys %tests) {
    is (qx($PERL_REQ "t/data/perl_$_"), $tests{$_}, "$_ found and normalized");
}


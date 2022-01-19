use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my $file     = "t/data/provides";
my @requires = qx($PERL_REQ $file);
my @provides = qx($PERL_PROV $file);

#
# Requires
my @expectedrequires = ("$perl_ns(version)\n");
is_deeply([ sort @requires ], [ sort @expectedrequires ], "Only '$perl_ns(version)' is required.");

#
# Provides
my @expectedprovides = (
    "$perl_ns(Alpha)\n",
    "$perl_ns(Alpha::Beta123) = 1.23\n",
    "$perl_ns(Beta) = 1.00\n",
    "$perl_ns(CGI::Apache) = 1.7\n",
    "$perl_ns(Config::General)\n",
    "$perl_ns(DBI) = 1.633\n",
    "$perl_ns(Delta) = 0.50\n",
    "$perl_ns(DynaLoader) = 1.03\n",
    "$perl_ns(ExtUtils::Install) = 1.8\n",
    "$perl_ns(ExtUtils::MM_Unix)\n",
    "$perl_ns(FindBin) = 1.9\n",
    "$perl_ns(Gamma) = 2.00\n",
    "$perl_ns(Iota) = 1\n",
    "$perl_ns(Kappa::Lambda) = 5.43\n",
    "$perl_ns(Omega) = 9.87\n",
    "$perl_ns(Template) = 3.45\n",
    "$perl_ns(Test::Kwalitee::Extra) = 0.3.0\n",
    "$perl_ns(Test::Pod::No404s) = 0.02\n",
    "$perl_ns(Theta)\n",
    "$perl_ns(XML::Grove) = 0.46\n",
    "$perl_ns(Xi)\n",
    "$perl_ns(Zeta) = 0.05\n",
    "$perl_ns(Module::ExtractUse) = 0.33\n",
    "$perl_ns(Module::Info)\n",
    "$perl_ns(IRI) = 0.004\n",
);

is_deeply([ sort @provides ], [ sort @expectedprovides ], "All expected provides were found.");

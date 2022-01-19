use strict;
use warnings;
use Test::More tests => 2;

my $file     = "t/data/provides";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Requires
is(scalar(@requires), 0, 'No module is required');

my @expectedprovides = (
    "perl(Alpha)\n",
    "perl(Alpha::Beta123) = 1.23\n",
    "perl(Beta) = 1.00\n",
    "perl(CGI::Apache) = 1.7\n",
    "perl(Config::General)\n",
    "perl(DBI) = 1.633\n",
    "perl(Delta) = 0.50\n",
    "perl(DynaLoader) = 1.03\n",
    "perl(ExtUtils::Install) = 1.8\n",
    "perl(ExtUtils::MM_Unix)\n",
    "perl(FindBin) = 1.9\n",
    "perl(Gamma) = 2.00\n",
    "perl(Iota) = 1\n",
    "perl(Kappa::Lambda) = 5.43\n",
    "perl(Omega) = 9.87\n",
    "perl(Template) = 3.45\n",
    "perl(Test::Kwalitee::Extra) = 0.3.0\n",
    "perl(Test::Pod::No404s) = 0.02\n",
    "perl(Theta)\n",
    "perl(XML::Grove) = 0.46\n",
    "perl(Xi)\n",
    "perl(Zeta) = 0.05\n",
);

is_deeply([ sort @provides ], [ sort @expectedprovides ], "All expected provides were found.");

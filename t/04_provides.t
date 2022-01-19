use strict;
use warnings;
use Test::More tests => 20;

my $file     = "t/data/provides";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Requires
is(scalar(@requires), 0, 'No module is required');

#
# Provides to be found
ok(grep(/^perl\(Alpha\)$/, @provides), "'perl(Alpha)' is provided");
ok(grep(/^perl\(Beta\) = 1.00$/, @provides), "'perl(Beta) = 1.00' is provided");
ok(grep(/^perl\(Gamma\) = 2.00$/, @provides), "'perl(Gamma) = 2.00' is provided");
ok(grep(/^perl\(Delta\) = 0.50$/, @provides), "'perl(Delta) = 0.50' is provided");

# BZ#1160263
#package Test::Pod::No404s;
#$Test::Pod::No404s::VERSION = '0.02';
ok(grep(/^perl\(Test::Pod::No404s\) = 0.02$/, @provides), "'perl(Test::Pod::No404s) = 0.02' is provided");

#package FindBin;
#our $VERSION = $VERSION = sprintf("%d.%02d", q$Revision: 1.9 $ =~ /(\d+)\.(\d+)$/, @provides);
ok(grep(/^perl\(FindBin\) = 1.9$/, @provides), "'perl(FindBin) = 1.9' is provided");

#package ExtUtils::Install;
#$VERSION = substr q$Revision: 1.8 $, 10;
ok(grep(/^perl\(ExtUtils::Install\) = 1.8$/, @provides), "'perl(ExtUtils::Install) = 1.8' is provided");

#package CGI::Apache;
#$VERSION = (qw$Revision: 1.7 $)[1];
ok(grep(/^perl\(CGI::Apache\) = 1.7$/, @provides), "'perl(CGI::Apache) = 1.7' is provided");

#package DynaLoader;
#$VERSION = $VERSION = "1.03";     # avoid typo warning
ok(grep(/^perl\(DynaLoader\) = 1.03$/, @provides), "'perl(DynaLoader) = 1.03' is provided");

#package Config::General;
#$Config::General::VERSION = 2.33;
ok(grep(/^perl\(Config::General\) = 2.33$/, @provides), "'perl(Config::General) = 2.33' is provided");

#package Alpha::Beta123;
#our $VERSION = $Alpha::Beta123::VERSION=1.23;
ok(grep(/^perl\(Alpha::Beta123\) = 1.23$/, @provides), "'perl(Alpha::Beta123) = 1.23' is provided");

#package Template;
#$Template::VERSION ="3.45";
ok(grep(/^perl\(Template\) = 3.45$/, @provides), "'perl(Template) = 3.45' is provided");

#package Zeta;
#$VERSION = "1.01";
#$VERSION = $VERSION + 0.05;
ok(grep(/^perl\(Zeta\) = 0.05$/, @provides), "'perl(Zeta) = 0.05' is provided");

#package Theta;
#$tmp = 1.56
#$VERSION = $tmp;
ok(grep(/^perl\(Theta\)$/, @provides), "'perl(Theta)' is provided");

ok(grep(/^perl\(Iota\) = 1$/, @provides), "'perl(Iota) = 1' is provided");

# package Omega;
# $VERSION="9.87_65";
ok(grep(/^perl\(Omega\) = 9.87$/, @provides), "'perl(Omega) = 9.87' is provided");

# package Test::Kwalitee::Extra;
# our $VERSION = 'v0.3.0';
ok(grep(/^perl\(Test::Kwalitee::Extra\) = 0.3.0$/, @provides), "'perl(Test::Kwalitee::Extra) = 0.3.0' is provided");

# package XML::Grove;
# $VERSION = '0.46alpha';
ok(grep(/^perl\(XML::Grove\) = 0.46$/, @provides), "'perl(XML::Grove) = 0.46' is provided");

#
# Check if expected amount of modules was found
is(scalar(@provides), 18, "Expected amount of modules was found");

use strict;
use warnings;
use Test::More tests => 6;

my $file     = "t/data/anymoose";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requiremets to be found
ok(grep(/^perl\(Any::Moose\) >= 0.18$/,@requires), "'perl(Any::Moose) >= 0.18' is required");
ok(grep(/^perl\(Mouse\)$/,@requires), "'perl(Mouse)' is required");
ok(grep(/^perl\(Mouse::Role\)$/,@requires), "'perl(Mouse::Role)' is required");

#
# Requirements to be ignore
ok(!grep(/^perl\(Any::Moose\)$/,@requires), "Unversioned 'perl(Any::Moose)' is not found");

#
# Check if expected amount of modules was found
is(scalar(@requires), 3, "Expected amount of modules was found");

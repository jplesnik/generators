use strict;
use warnings;
use Test::More tests => 2;

my $file     = "t/data/variables";
my @requires = qx(bin/perl.req $file);
my @provides = qx(bin/perl.prov $file);

#
# Provides
is(scalar(@provides), 0, 'No package is provided');

#
# Requires
is(scalar(@requires), 0, 'No package is required');

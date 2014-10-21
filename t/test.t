use strict;
use warnings;

use Test::More tests => 17;

my @requires = qx(bin/perl.req t/testdata);

my @provides = qx(bin/perl.prov t/testdata);

#
# Provides
ok(grep(/perl\(Test\)/, @provides), 'Test module is provided');
ok(grep(/perl\(TMP::tmp\)/, @provides), 'TMP::tmp module is provided');

#
# Requires
my @list_requires = ("Test::Simple", "POE", "Any::Moose", "aliased",
    "Moose", "Test::Requires", "base", "Exporter", "parent", "DBI",
    "File::Copy", "Carp", "Use::WhiteSpace",
);
foreach my $mod (@list_requires) {
    ok(grep(/^perl\($mod\)$/,@requires), "$mod module is required")
}

ok(grep(/perl >= 1:5.6.1/, @requires), "'perl >= 1:5.6.1' is required");
ok(grep(/perl\(version\) >= 0.77/, @requires), "'perl(version) >= 0.77' is required");

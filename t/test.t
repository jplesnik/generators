use strict;
use warnings;

use Test::More tests => 17;

use lib 't/lib';
use PerlNS qw($PERL_NAMESPACE $PERL_PROV $PERL_REQ);

my $perl_ns = $PERL_NAMESPACE;

my @requires = qx($PERL_REQ t/testdata);
my @provides = qx($PERL_PROV t/testdata);

#
# Provides
ok(grep(/$perl_ns\(Test\)/, @provides), 'Test module is provided');
ok(grep(/$perl_ns\(TMP::tmp\)/, @provides), 'TMP::tmp module is provided');

#
# Requires
my @list_requires = ("Test::Simple", "POE", "Any::Moose", "aliased",
    "Moose", "Test::Requires", "base", "Exporter", "parent", "DBI",
    "File::Copy", "Carp", "Use::WhiteSpace",
);
foreach my $mod (@list_requires) {
    ok(grep(/^$perl_ns\($mod\)$/,@requires), "$mod module is required")
}

ok(grep(/$perl_ns\(:VERSION\) >= 5\.6\.1/, @requires), "'$perl_ns(:VERSION) >= 5.6.1' is required");
ok(grep(/$perl_ns\(version\) >= 0.77/, @requires), "'$perl_ns(version) >= 0.77' is required");

package PerlNS;

use strict;
use warnings;
use Exporter; # 'import';

our @ISA    = qw/Exporter/;
our @EXPORT = qw/$PERL_NAMESPACE $PERL_PROV $PERL_REQ/;

our $PERL_NAMESPACE = "__PERL_NS__";
our $PERL_PROV      = "bin/perl.prov" . "__PERL_SUFFIX__";
our $PERL_REQ       = "bin/perl.req" . "__PERL_SUFFIX__";

1;

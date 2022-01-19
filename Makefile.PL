use strict;
use warnings;

use ExtUtils::MakeMaker;
use File::Copy;
use File::Find;

my $perl_ns = "perl";
my $suffix  = "";

if (defined $ENV{'PERL_NS'} && $ENV{'PERL_NS'} !~ /^$/) {
    $perl_ns = $ENV{'PERL_NS'} . "-" . $perl_ns;
    $suffix  = "." . $ENV{'PERL_NS'};
}

my @directories_to_search = ("template");
File::Find::find({
    wanted            => \&wanted,
    untaint           => 1,
    no_chdir          => 1,
  }, @directories_to_search);

sub wanted {
    my $tmpl = $File::Find::name;
    my $dir  = $File::Find::dir;
    if ( -f $tmpl) {
        my $file = $tmpl;
        $file =~ s/template\///;
        $dir =~ s/template\///;
	system("mkdir $dir") if (! -d $dir);
        $file = $file.$suffix if ($file =~ m/bin/);
        copy("$tmpl", "$file") or die "Copy failed: $!";
        system("sed -i 's/__PERL_NS__/$perl_ns/' $file");
        system("sed -i 's/__PERL_SUFFIX__/$suffix/' $file");
        system("chmod 755 $file") if ($file =~ m/bin/);
    }
}
 
WriteMakefile(
    'NAME' => 'generators',
    'VERSION' => '1.12',
    'AUTHOR' => 'Jitka Plesnikova <jplesnik@redhat.com>',
    'LICENSE' => 'gpl',
    'EXE_FILES' => [ "bin/perl.prov$suffix", "bin/perl.req$suffix" ],
    'BUILD_REQUIRES' => { 
    },
    'PREREQ_PM' => {
        'Fedora::VSP' => 0,
        'version' => 0,
    },
    TEST_REQUIRES => {
        'Test::More' => 0,
        'strict' => 0,
        'warnings' => 0,
    },
    'CONFIGURE_REQUIRES' => {
        'ExtUtils::MakeMaker' => 0,
    },
    'META_MERGE' => {
        'resources' => {
            'homepage' =>
                'http://jplesnik.fedorapeople.org/generators/',
        },
    },
    'test' => {
        'TESTS' => 't/*.t',
    },
);

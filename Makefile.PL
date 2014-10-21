use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'generators',
    'VERSION' => '1.00',
    'AUTHOR' => 'Jitka Plesnikova <jplesnik@redhat.com>',
    'LICENSE' => 'gpl',
    'EXE_FILES' => [ ( glob 'bin/*' ) ],
    'BUILD_REQUIRES' => { 
    },
    'PREREQ_PM' => {
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

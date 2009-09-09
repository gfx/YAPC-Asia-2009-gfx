use strict;
use warnings;
use inc::Module::Install;

all_from 'lib/Magic/Example.pm';

use_ppport 3.19;
cc_warnings;

test_requires 'Test::More' => 0.88; # done_testing()

tests 't/*.t';
author_tests 'xt';

auto_set_repository() if -d '.git';

clean_files qw(
	Magic-Example-* *.stackdump
	*.gcda *.gcno *.gcov
	nytprof *.out
	cover_db
);

WriteAll check_nmake => 0;


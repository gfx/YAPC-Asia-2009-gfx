use strict;
use warnings;
use inc::Module::Install;

BEGIN{
	unless(defined &use_ppport){
		die "This distribution requires Module::Install::XSUtil.\n";
	}
}

all_from 'lib/Magic/Watch.pm';

use_ppport 3.19;
cc_warnings;

test_requires 'Test::More' => 0.88; # done_testing()

tests 't/*.t';
author_tests 'xt';

auto_set_repository() if -d '.git';

clean_files qw(
	Magic-Watch-* *.stackdump
	*.gcda *.gcno *.gcov
	nytprof *.out
	cover_db
);

WriteAll check_nmake => 0;


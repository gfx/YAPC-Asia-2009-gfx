#!perl -w
use strict;
use Magic::Watch;
use Devel::Peek;

{
	my @ary;

	Magic::Watch::attach(@ary, '@ary');

	$ary[0]++;

	@ary = ('foo');

	printf "size: %d\n", scalar @ary;
}

print "Hello, world!\n";

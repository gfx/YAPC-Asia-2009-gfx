#!perl -w
use strict;
use Magic::Watch;
use Devel::Peek;
#use threads;
{
	my $var;

	Magic::Watch::attach($var, '$var');

	$var = 'foo';

	#threads->new(sub{ scalar length $var })->join();

	$var++;

	printf "length=%d\n", length $var;
}

print "Hello, world!\n";

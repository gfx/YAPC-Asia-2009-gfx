#!perl -w
use strict;
use Magic::Watch;

our $var;
our @ary;

{
	(); # dummy statement

	Magic::Watch::attach($var, '$var');

	local $var = 'foo';

	print '$var=', $var, "\n";

	Magic::Watch::attach(@ary, '@ary');
	local @ary = ('bar');

	print "\@ary=(@ary)\n";
}

print "Hello, world!\n";

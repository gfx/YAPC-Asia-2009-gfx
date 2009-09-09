#!perl -w
use strict;
use Magic::Watch;
use Devel::Peek;

{
	my %hash;

	Magic::Watch::attach(%hash, '%hash');

	$hash{foo}++;

	%hash = (bar => 42);

	print $hash{bar}, "\n";

	printf "size: %s\n", scalar %hash;
}

print "Hello, world!\n";

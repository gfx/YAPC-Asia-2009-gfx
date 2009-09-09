#!perl -w
use strict;
use Magic::Watch;

{
	my $foo;
	&Magic::Watch::attach(sub{ $foo }, '(anon closure)');
}

{
	&Magic::Watch::attach(sub{ 42 }, '(anon subroutine)');
}


sub foo{}

&Magic::Watch::attach(\&foo, '&foo');

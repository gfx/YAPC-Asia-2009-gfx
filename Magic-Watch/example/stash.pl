#!perl -w
use strict;
use Magic::Watch;

package Foo;

BEGIN{
	Magic::Watch::attach(%Foo::, '%Foo::');
}

our $global_var;

sub foo{
	print "Hello, world!\n";
}


foo();

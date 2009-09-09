#!perl -w
use strict;
use Magic::Watch;

our $global_var;

Magic::Watch::attach($global_var, '$global_var');

$global_var++;

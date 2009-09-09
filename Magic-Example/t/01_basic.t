#!perl -w

use strict;
use Test::More;
use Test::Exception;

use Magic::Example;

use Tie::Scalar;

tie my $tied_scalar, 'Tie::StdScalar', {};

lives_ok{
    do_something_to_hashref_wrong($tied_scalar);
} 'bad example';


lives_ok{
    do_something_to_hashref_correct($tied_scalar);
} 'good example';


done_testing;

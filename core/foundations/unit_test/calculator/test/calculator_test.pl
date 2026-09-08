#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
require "$FindBin::Bin/../src/calculator.pl";

use Test2::Bundle::More;

is(addition(2, 3), 5, 'addition(2, 3) returns 5');
is(subtraction(5, 2), 3, 'subtraction(5, 2) returns 3');
is(multiplication(3, 4), 12, 'multiplication(3, 4) returns 12');
is(division(10, 3), 3, 'division(10, 3) returns 3');
is(modulus(10, 3), 1, 'modulus(10, 3) returns 1');

done_testing;

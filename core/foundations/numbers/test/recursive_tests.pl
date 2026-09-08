#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
require "$FindBin::Bin/../src/numbers.pl";

use Test2::Bundle::More;

subtest 'sum_of_first_n_rec' => sub {
    is(sum_of_first_n_rec(0), 0, 'n=0');
    is(sum_of_first_n_rec(3), 6, 'n=3');
};

subtest 'factorial_rec' => sub {
    is(factorial_rec(0), 1, 'n=0');
    is(factorial_rec(4), 24, 'n=4');
};

subtest 'fibonacci_rec' => sub {
    is(fibonacci_rec(0), 0, 'n=0');
    is(fibonacci_rec(1), 1, 'n=1');
    is(fibonacci_rec(6), 8, 'n=6');
};

subtest 'greatest_common_divisor_rec' => sub {
    is(greatest_common_divisor_rec(12, 8), 4, '(12,8)');
    is(greatest_common_divisor_rec(7, 5), 1, '(7,5)');
};

subtest 'least_common_multiple_rec' => sub {
    is(least_common_multiple_rec(4, 6), 12, '(4,6)');
    is(least_common_multiple_rec(6, 8), 24, '(6,8)');
};

done_testing;

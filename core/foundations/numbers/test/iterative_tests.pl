#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
require "$FindBin::Bin/../src/numbers.pl";

use Test2::Bundle::More;

subtest 'sum_of_first_n_ite' => sub {
    is(sum_of_first_n_ite(0), 0, 'n=0');
    is(sum_of_first_n_ite(3), 6, 'n=3');
};

subtest 'factorial_ite' => sub {
    is(factorial_ite(0), 1, 'n=0');
    is(factorial_ite(4), 24, 'n=4');
};

subtest 'fibonacci_ite' => sub {
    is(fibonacci_ite(0), 0, 'n=0');
    is(fibonacci_ite(1), 1, 'n=1');
    is(fibonacci_ite(6), 8, 'n=6');
};

subtest 'greatest_common_divisor_ite' => sub {
    is(greatest_common_divisor_ite(12, 8), 4, '(12,8)');
    is(greatest_common_divisor_ite(7, 5), 1, '(7,5)');
};

subtest 'least_common_multiple_ite' => sub {
    is(least_common_multiple_ite(4, 6), 12, '(4,6)');
    is(least_common_multiple_ite(6, 8), 24, '(6,8)');
};

done_testing;

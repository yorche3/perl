#!/usr/bin/perl
use strict;
use warnings;

# Direct recursion (_rec)

sub sum_of_first_n_rec {
    my ($n) = @_;
    return 0 if $n <= 0;
    return $n + sum_of_first_n_rec($n - 1);
}

sub factorial_rec {
    my ($n) = @_;
    return 1 if $n <= 0;
    return $n * factorial_rec($n - 1);
}

sub fibonacci_rec {
    my ($n) = @_;
    return $n if $n <= 1;
    return fibonacci_rec($n - 1) + fibonacci_rec($n - 2);
}

sub greatest_common_divisor_rec {
    my ($a, $b) = @_;
    return $a if $b == 0;
    return greatest_common_divisor_rec($b, $a % $b);
}

sub least_common_multiple_rec {
    my ($a, $b) = @_;
    return int($a * $b / greatest_common_divisor_rec($a, $b));
}

# Accumulator recursion (_acc): educational bridge, no TCO in Perl

sub sum_of_first_n_acc_help {
    my ($n, $acc) = @_;
    return $acc if $n <= 0;
    return sum_of_first_n_acc_help($n - 1, $n + $acc);
}

sub sum_of_first_n_acc {
    my ($n) = @_;
    return sum_of_first_n_acc_help($n, 0);
}

sub factorial_acc_help {
    my ($n, $acc) = @_;
    return $acc if $n <= 1;
    return factorial_acc_help($n - 1, $n * $acc);
}

sub factorial_acc {
    my ($n) = @_;
    return factorial_acc_help($n, 1);
}

sub fibonacci_acc_help {
    my ($n, $acc2, $acc1) = @_;
    return $acc2 if $n <= 0;
    return $acc1 + $acc2 if $n <= 2;
    return fibonacci_acc_help($n - 1, $acc1, $acc1 + $acc2);
}

sub fibonacci_acc {
    my ($n) = @_;
    return fibonacci_acc_help($n, 0, 1);
}

sub greatest_common_divisor_acc_help {
    my ($a, $b) = @_;
    return $a if $b == 0;
    return greatest_common_divisor_acc_help($b, $a % $b);
}

sub greatest_common_divisor_acc {
    my ($a, $b) = @_;
    return greatest_common_divisor_acc_help($a, $b);
}

sub least_common_multiple_acc {
    my ($a, $b) = @_;
    return int($a * $b / greatest_common_divisor_acc($a, $b));
}

# Iterative (_ite)

sub sum_of_first_n_ite {
    my ($n) = @_;
    my $result = 0;
    for my $i (1 .. $n) {
        $result += $i;
    }
    return $result;
}

sub factorial_ite {
    my ($n) = @_;
    my $result = 1;
    for my $i (2 .. $n) {
        $result *= $i;
    }
    return $result;
}

sub fibonacci_ite {
    my ($n) = @_;
    return $n if $n <= 1;
    my $acc2 = 0;
    my $acc1 = 1;
    for (2 .. $n) {
        my $temp = $acc1 + $acc2;
        $acc2 = $acc1;
        $acc1 = $temp;
    }
    return $acc1;
}

sub greatest_common_divisor_ite {
    my ($a, $b) = @_;
    while ($b != 0) {
        my $temp = $b;
        $b = $a % $b;
        $a = $temp;
    }
    return $a;
}

sub least_common_multiple_ite {
    my ($a, $b) = @_;
    return int($a * $b / greatest_common_divisor_ite($a, $b));
}

1;

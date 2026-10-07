#!/usr/bin/perl
use strict;
use warnings;

sub addition {
    my ($a, $b) = @_;
    return $a + $b;
}

sub subtraction {
    my ($a, $b) = @_;
    return $a - $b;
}

sub multiplication {
    my ($a, $b) = @_;
    my $result = 0;
    for (1 .. $b) {
        $result = addition($result, $a);
    }
    return $result;
}

sub division {
    my ($a, $b) = @_;
    my $quotient = 0;
    while ($a >= $b) {
        $a = subtraction($a, $b);
        $quotient = addition($quotient, 1);
    }
    return $quotient;
}

sub modulus {
    my ($a, $b) = @_;
    my $q = division($a, $b);
    my $p = multiplication($q, $b);
    return subtraction($a, $p);
}

1;

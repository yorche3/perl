#!/usr/bin/perl
use strict;
use warnings;

# NaiveSort — ordenamientos elementales O(n²).
#
# Especificación: 05_Naive_Sort

sub selection_sort {
    my @array = @_;
    my $n = scalar @array;
    for my $i (0 .. $n - 2) {
        my $min_index = $i;
        for my $j ($i + 1 .. $n - 1) {
            if ($array[$j] < $array[$min_index]) {
                $min_index = $j;
            }
        }
        if ($min_index != $i) {
            my $temp = $array[$i];
            $array[$i] = $array[$min_index];
            $array[$min_index] = $temp;
        }
    }
    return @array;
}

sub bubble_sort {
    my @array = @_;
    my $n = scalar @array;
    for my $i (0 .. $n - 2) {
        my $swapped = 0;
        for my $j (0 .. $n - 2 - $i) {
            if ($array[$j] > $array[$j + 1]) {
                my $temp = $array[$j];
                $array[$j] = $array[$j + 1];
                $array[$j + 1] = $temp;
                $swapped = 1;
            }
        }
        last unless $swapped;
    }
    return @array;
}

sub insertion_sort {
    my @array = @_;
    my $n = scalar @array;
    for my $i (1 .. $n - 1) {
        my $key = $array[$i];
        my $j = $i - 1;
        while ($j >= 0 && $array[$j] > $key) {
            $array[$j + 1] = $array[$j];
            $j--;
        }
        $array[$j + 1] = $key;
    }
    return @array;
}

1;

#!/usr/bin/perl
use strict;
use warnings;

# NaiveSort — ordenamientos elementales O(n²).
#
# Especificación: 05_Naive_Sort
#
# Cada función recibe un arrayref, lo ordena in-place y devuelve ese mismo
# arrayref. Si la entrada es `undef`, devuelve `undef` como indicador de fallo,
# sin lanzar excepciones.

sub selection_sort {
    my ($arr) = @_;
    return undef unless defined $arr;

    my $n = scalar @$arr;
    return $arr if $n <= 1;

    for my $i (0 .. $n - 2) {
        my $min_index = $i;
        for my $j ($i + 1 .. $n - 1) {
            $min_index = $j if $arr->[$j] < $arr->[$min_index];
        }
        if ($min_index != $i) {
            my $temp = $arr->[$i];
            $arr->[$i] = $arr->[$min_index];
            $arr->[$min_index] = $temp;
        }
    }

    return $arr;
}

sub bubble_sort {
    my ($arr) = @_;
    return undef unless defined $arr;

    my $n = scalar @$arr;
    return $arr if $n <= 1;

    for my $i (0 .. $n - 2) {
        my $swapped = 0;
        for my $j (0 .. $n - 2 - $i) {
            if ($arr->[$j] > $arr->[$j + 1]) {
                my $temp = $arr->[$j];
                $arr->[$j] = $arr->[$j + 1];
                $arr->[$j + 1] = $temp;
                $swapped = 1;
            }
        }
        last unless $swapped;
    }

    return $arr;
}

sub insertion_sort {
    my ($arr) = @_;
    return undef unless defined $arr;

    my $n = scalar @$arr;
    return $arr if $n <= 1;

    for my $i (1 .. $n - 1) {
        my $key = $arr->[$i];
        my $j = $i - 1;
        while ($j >= 0 && $arr->[$j] > $key) {
            $arr->[$j + 1] = $arr->[$j];
            $j--;
        }
        $arr->[$j + 1] = $key;
    }

    return $arr;
}

1;

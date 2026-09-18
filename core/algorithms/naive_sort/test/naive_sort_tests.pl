#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
require "$FindBin::Bin/../src/naive_sort.pl";

use Test2::Bundle::More;

# Casos de prueba de la especificación 05_Naive_Sort.md
#
# Caso nulo incluido: en Perl el indicador de fallo del contrato es `undef`, que
# sí es representable, así que se comprueba de forma independiente del caso
# vacío. No se espera ninguna excepción.

my @standard_input  = (5, 2, 9, 1, 5, 6);
my @standard_output = (1, 2, 5, 5, 6, 9);

my @sorted_input  = (1, 2, 3, 4, 5);
my @sorted_output = (1, 2, 3, 4, 5);

my @reverse_input  = (5, 4, 3, 2, 1);
my @reverse_output = (1, 2, 3, 4, 5);

my @identical_input  = (7, 7, 7, 7);
my @identical_output = (7, 7, 7, 7);

my @negative_input  = (3, -1, 4, -5, 0);
my @negative_output = (-5, -1, 0, 3, 4);

my @single_input  = (42);
my @single_output = (42);

my @empty_input  = ();
my @empty_output = ();

my @cases = (
    {
        description => 'an unsorted array',
        input       => [@standard_input],
        expected    => [@standard_output],
    },
    {
        description => 'an already sorted array',
        input       => [@sorted_input],
        expected    => [@sorted_output],
    },
    {
        description => 'a reverse ordered array',
        input       => [@reverse_input],
        expected    => [@reverse_output],
    },
    {
        description => 'an array of identical elements',
        input       => [@identical_input],
        expected    => [@identical_output],
    },
    {
        description => 'an array with negative numbers',
        input       => [@negative_input],
        expected    => [@negative_output],
    },
    {
        description => 'a single element array',
        input       => [@single_input],
        expected    => [@single_output],
    },
    {
        description => 'an empty array',
        input       => [@empty_input],
        expected    => [@empty_output],
    },
    {
        description => 'a null input',
        input       => undef,
        expected    => undef,
    },
);

# Helper compartido: recibe la función a probar y el nombre del algoritmo, y
# ejecuta todos los casos con un mensaje descriptivo cada uno.
#
# Cada caso ordena una copia del fixture (`[@$input]`), porque los tres
# algoritmos ordenan in-place sobre el arrayref recibido.
sub assert_sorts_all_cases {
    my ($sort, $algorithm) = @_;

    for my $case (@cases) {
        my $input  = $case->{input};
        my $actual = defined $input ? $sort->([@$input]) : $sort->(undef);

        is_deeply($actual, $case->{expected},
            "$algorithm should sort $case->{description}");
    }
}

subtest 'selection_sort' => sub {
    assert_sorts_all_cases(\&selection_sort, 'selection_sort');
};

subtest 'bubble_sort' => sub {
    assert_sorts_all_cases(\&bubble_sort, 'bubble_sort');
};

subtest 'insertion_sort' => sub {
    assert_sorts_all_cases(\&insertion_sort, 'insertion_sort');
};

done_testing;

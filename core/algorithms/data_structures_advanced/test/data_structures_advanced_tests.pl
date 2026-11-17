#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Scalar::Util qw(blessed);

use DataStructuresAdvanced::Node;
use DataStructuresAdvanced::TreeNode;
use DataStructuresAdvanced::GraphNode;
use DataStructuresAdvanced::BinaryTree;
use DataStructuresAdvanced::Graph;

use Test2::Bundle::More;

# Casos de prueba de la especificación 07_Data_Structures_Advanced
#
# Cada caso usa una instancia recién construida con `new` (el `init` de la
# especificación) y ejecuta sus pasos en orden.
#
# Adecuaciones: la ausencia es `undef`; `insert`, `contains`, `add_vertex`,
# `add_edge` y `has_edge` devuelven 1 (éxito) o 0 (fallo); `get_neighbors`
# devuelve una referencia a array independiente o `undef` (fallo), distinto de
# `[]`. `get_value`, `get_left`, `get_right` equivalen a `value`, `left`, `right`.
# `call` devuelve `undef` si el objeto no existe, para que un contrato aún sin
# cuerpo produzca fallos de aserción y no excepciones.
# El caso «Adaptación inmutable» no aplica: `TreeNode` es mutable.

sub call {
    my ($object, $method, @args) = @_;
    return blessed($object) ? $object->$method(@args) : undef;
}

sub tree_node {
    my ($value) = @_;
    return DataStructuresAdvanced::TreeNode->new(value => $value);
}

subtest 'TreeNode' => sub {
    my $node = tree_node(10);
    is(call($node, 'value'), 10, 'Crear un nodo de árbol: get_value() should be 10');

    is(call($node, 'left'), undef, 'Enlaces iniciales ausentes: get_left() should be absent');
    is(call($node, 'right'), undef, 'Enlaces iniciales ausentes: get_right() should be absent');

    my $parent = tree_node(10);
    call($parent, 'set_left', tree_node(20));
    call($parent, 'set_right', tree_node(30));
    is(call(call($parent, 'left'), 'value'), 20, 'Enlazar dos hijos: left value should be 20');
    is(call(call($parent, 'right'), 'value'), 30, 'Enlazar dos hijos: right value should be 30');

    my $left = call($parent, 'left');
    my $right = call($parent, 'right');
    is(call($left, 'value'), 20, 'Recorrer cada enlace: left child should lead to 20');
    is(call($right, 'value'), 30, 'Recorrer cada enlace: right child should lead to 30');
    is(call($left, 'left'), undef, 'Recorrer cada enlace: left child get_left() should be absent');
    is(call($left, 'right'), undef, 'Recorrer cada enlace: left child get_right() should be absent');
    is(call($right, 'left'), undef, 'Recorrer cada enlace: right child get_left() should be absent');
    is(call($right, 'right'), undef, 'Recorrer cada enlace: right child get_right() should be absent');

    my $p = tree_node(10);
    call($p, 'set_left', tree_node(20));
    call($p, 'set_right', tree_node(30));
    call($p, 'set_left', undef);
    is(call($p, 'left'), undef, 'Desenlazar hijos: left should be absent after clearing left');
    is(call($p, 'value'), 10, 'Desenlazar hijos: value should stay 10 after clearing left');
    is(call(call($p, 'right'), 'value'), 30, 'Desenlazar hijos: right child should stay 30 after clearing left');
    call($p, 'set_right', undef);
    is(call($p, 'left'), undef, 'Desenlazar hijos: left should be absent after clearing right');
    is(call($p, 'right'), undef, 'Desenlazar hijos: right should be absent after clearing right');
    is(call($p, 'value'), 10, 'Desenlazar hijos: value should stay 10 after clearing right');
};

# Ejecución compartida: inserta `@values`, comprueba cada alta, pertenencia y tamaño.
sub check_tree {
    my ($name, $inserts, $expected_size, $present, $absent) = @_;

    my $tree = DataStructuresAdvanced::BinaryTree->new;
    for my $value (@$inserts) {
        is(call($tree, 'insert', $value), 1, "$name: insert($value) should succeed");
    }
    is(call($tree, 'size'), $expected_size, "$name: size should be $expected_size");
    is(call($tree, 'contains', $_), 1, "$name: contains($_) should succeed") for @$present;
    is(call($tree, 'contains', $_), 0, "$name: contains($_) should fail") for @$absent;
}

subtest 'BinaryTree' => sub {
    my $empty = DataStructuresAdvanced::BinaryTree->new;
    ok(call($empty, 'is_empty'), 'Crear vacío: is_empty should be true');
    is(call($empty, 'size'), 0, 'Crear vacío: size should be 0');
    is(call($empty, 'contains', 50), 0, 'Crear vacío: contains(50) should fail');

    my $root = DataStructuresAdvanced::BinaryTree->new;
    is(call($root, 'insert', 50), 1, 'Insertar la raíz: insert(50) should succeed');
    is(call($root, 'size'), 1, 'Insertar la raíz: size should be 1');
    ok(defined call($root, 'is_empty') && !call($root, 'is_empty'), 'Insertar la raíz: is_empty should be false');
    is(call($root, 'contains', 50), 1, 'Insertar la raíz: contains(50) should succeed');

    check_tree('Insertar menor y mayor', [ 50, 30, 70 ], 3, [ 50, 30, 70 ], []);
    check_tree('Ramas de varios niveles', [ 50, 30, 70, 20, 40 ], 5, [ 50, 30, 70, 20, 40 ], []);

    my $one = DataStructuresAdvanced::BinaryTree->new;
    call($one, 'insert', 50);
    is(call($one, 'contains', 99), 0, 'Valor ausente en árbol no vacío: contains(99) should fail');
    is(call($one, 'size'), 1, 'Valor ausente en árbol no vacío: size should stay 1');
    is(call($one, 'contains', 50), 1, 'Valor ausente en árbol no vacío: contains(50) should still succeed');

    check_tree('Duplicado idempotente', [ 50, 30, 70, 30 ], 3, [ 50, 30, 70 ], []);
    check_tree('Inserciones ordenadas', [ 20, 30, 40, 50, 70 ], 5, [ 20, 30, 40, 50, 70 ], [99]);
};

# Grafo recién construido con los vértices indicados.
sub graph_with {
    my (@labels) = @_;
    my $graph = DataStructuresAdvanced::Graph->new;
    call($graph, 'add_vertex', $_) for @labels;
    return $graph;
}

sub check_counts {
    my ($name, $graph, $vertices, $edges) = @_;
    is(call($graph, 'vertex_count'), $vertices, "$name: vertex_count should be $vertices");
    is(call($graph, 'edge_count'), $edges, "$name: edge_count should be $edges");
}

subtest 'Graph' => sub {
    my $name;

    $name = 'Crear vacío';
    my $empty = DataStructuresAdvanced::Graph->new;
    ok(call($empty, 'is_empty'), "$name: is_empty should be true");
    check_counts($name, $empty, 0, 0);
    is(call($empty, 'has_edge', 10, 30), 0, "$name: has_edge(10,30) should fail");
    is(call($empty, 'get_neighbors', 10), undef, "$name: get_neighbors(10) should fail");

    $name = 'Vértice aislado';
    my $isolated = DataStructuresAdvanced::Graph->new;
    is(call($isolated, 'add_vertex', 10), 1, "$name: add_vertex(10) should succeed");
    ok(defined call($isolated, 'is_empty') && !call($isolated, 'is_empty'), "$name: is_empty should be false");
    check_counts($name, $isolated, 1, 0);
    is_deeply(call($isolated, 'get_neighbors', 10), [], "$name: neighbours of 10 should be empty");

    $name = 'Etiquetas no consecutivas y arista dirigida';
    my $directed = DataStructuresAdvanced::Graph->new;
    is(call($directed, 'add_vertex', 10), 1, "$name: add_vertex(10) should succeed");
    is(call($directed, 'add_vertex', 70), 1, "$name: add_vertex(70) should succeed");
    is(call($directed, 'add_edge', 10, 70), 1, "$name: add_edge(10,70) should succeed");
    is(call($directed, 'has_edge', 10, 70), 1, "$name: has_edge(10,70) should succeed");
    is(call($directed, 'has_edge', 70, 10), 0, "$name: has_edge(70,10) should fail");
    check_counts($name, $directed, 2, 1);

    $name = 'Vértice duplicado conserva adyacencia';
    my $dup_vertex = graph_with(10, 30);
    is(call($dup_vertex, 'add_edge', 10, 30), 1, "$name: add_edge(10,30) should succeed");
    is(call($dup_vertex, 'add_vertex', 10), 1, "$name: duplicate add_vertex(10) should succeed");
    check_counts($name, $dup_vertex, 2, 1);
    is_deeply(call($dup_vertex, 'get_neighbors', 10), [30], "$name: neighbours of 10 should be [30]");

    $name = 'Arista duplicada';
    my $dup_edge = graph_with(10, 30);
    is(call($dup_edge, 'add_edge', 10, 30), 1, "$name: first add_edge(10,30) should succeed");
    is(call($dup_edge, 'add_edge', 10, 30), 1, "$name: second add_edge(10,30) should succeed");
    check_counts($name, $dup_edge, 2, 1);
    is_deeply(call($dup_edge, 'get_neighbors', 10), [30], "$name: neighbours of 10 should be [30]");

    $name = 'Extremo inexistente sin mutación';
    my $missing = graph_with(10, 30);
    call($missing, 'add_edge', 10, 30);
    for my $pair ([ 10, 99 ], [ 99, 10 ], [ 98, 99 ], [ 99, 99 ]) {
        is(call($missing, 'add_edge', @$pair), 0, "$name: add_edge($pair->[0],$pair->[1]) should fail");
    }
    check_counts($name, $missing, 2, 1);
    is_deeply(call($missing, 'get_neighbors', 10), [30], "$name: neighbours of 10 should be [30]");
    is_deeply(call($missing, 'get_neighbors', 30), [], "$name: neighbours of 30 should be empty");
    for my $pair ([ 10, 99 ], [ 99, 10 ], [ 98, 99 ], [ 99, 99 ]) {
        is(call($missing, 'has_edge', @$pair), 0, "$name: has_edge($pair->[0],$pair->[1]) should fail");
    }
    is(call($missing, 'get_neighbors', 98), undef, "$name: get_neighbors(98) should fail");
    is(call($missing, 'get_neighbors', 99), undef, "$name: get_neighbors(99) should fail");

    $name = 'Vecinos ordenados y contadores';
    my $sorted = graph_with(10, 30, 50, 70);
    for my $pair ([ 10, 70 ], [ 10, 30 ], [ 10, 50 ], [ 30, 50 ]) {
        is(call($sorted, 'add_edge', @$pair), 1, "$name: add_edge($pair->[0],$pair->[1]) should succeed");
    }
    my %expected = (10 => [ 30, 50, 70 ], 30 => [50], 50 => [], 70 => []);
    is_deeply(call($sorted, 'get_neighbors', $_), $expected{$_}, "$name: neighbours of $_ should be [@{$expected{$_}}]")
        for sort { $a <=> $b } keys %expected;
    check_counts($name, $sorted, 4, 4);

    $name = 'Consulta de arista ausente';
    my $no_edge = graph_with(10, 30);
    is(call($no_edge, 'has_edge', 10, 30), 0, "$name: has_edge(10,30) should fail");
    check_counts($name, $no_edge, 2, 0);
    ok(defined call($no_edge, 'is_empty') && !call($no_edge, 'is_empty'), "$name: is_empty should be false");

    $name = 'Vecinos de vértice inexistente';
    my $one = graph_with(10);
    is(call($one, 'get_neighbors', 99), undef, "$name: get_neighbors(99) should fail");
    is_deeply(call($one, 'get_neighbors', 10), [], "$name: neighbours of 10 should be empty, not failure");
    check_counts($name, $one, 1, 0);

    $name = 'Bucle y duplicado';
    my $loop = graph_with(10);
    is(call($loop, 'add_edge', 10, 10), 1, "$name: first add_edge(10,10) should succeed");
    is(call($loop, 'add_edge', 10, 10), 1, "$name: second add_edge(10,10) should succeed");
    is(call($loop, 'has_edge', 10, 10), 1, "$name: has_edge(10,10) should succeed");
    is_deeply(call($loop, 'get_neighbors', 10), [10], "$name: neighbours of 10 should be [10]");
    check_counts($name, $loop, 1, 1);

    $name = 'Aislamiento del resultado de vecinos';
    my $iso = graph_with(10, 30, 50);
    call($iso, 'add_edge', 10, 30);
    my $saved = call($iso, 'get_neighbors', 10);
    my $copy = call($iso, 'get_neighbors', 10);
    push @$copy, 99 if ref $copy eq 'ARRAY';
    is_deeply(call($iso, 'get_neighbors', 10), [30], "$name: changing a returned copy should not change the graph");
    call($iso, 'add_edge', 10, 50);
    is_deeply($saved, [30], "$name: saved result should remain [30]");
    is_deeply(call($iso, 'get_neighbors', 10), [ 30, 50 ], "$name: fresh query should be [30,50]");
    check_counts($name, $iso, 3, 2);
};

done_testing;

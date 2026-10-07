#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use DataStructuresBasics::Node;
use DataStructuresBasics::LinkedList;
use DataStructuresBasics::Stack;
use DataStructuresBasics::Queue;

use Test2::Bundle::More;

# Casos de prueba de la especificación 06_Data_Structures_Basics
#
# Cada estructura se prueba como pasos sucesivos sobre una misma instancia: se
# construye una sola vez con `new` (el `init` idiomático de Moo) y cada fila de
# la especificación continúa sobre el mismo estado lógico.
#
# Adecuaciones: los valores son enteros positivos para no colisionar con los
# indicadores; `head_value`, `pop`, `peek` y `dequeue` devuelven -1 en el caso
# vacío; `delete` devuelve éxito o fallo (booleano) e `is_empty`, un booleano.
# El recorrido observa solo el contrato: la cabeza (`head`) y los accesores
# `value` y `next` del `Node` compartido, equivalentes a `get_head`, `get_value`
# y `get_next`.

# Valores de la lista, desde la cabeza, siguiendo el enlace de cada `Node`.
sub list_values {
    my ($list) = @_;

    my @values;
    my $node = $list->head;
    while ($node) {
        push @values, $node->value;
        $node = $node->next;
    }

    return @values;
}

subtest 'Node' => sub {
    my $a = DataStructuresBasics::Node->new(value => 10);
    is($a->value, 10, 'init asigna el valor 10');
    is($a->next, undef, 'el enlace inicial es ausente');

    my $b = DataStructuresBasics::Node->new(value => 20);
    $a->next($b);
    is($a->next->value, 20, 'get_value(get_next(a)) = 20');
    is($b->next, undef, 'el siguiente de b es ausente');
};

subtest 'LinkedList' => sub {
    my $list = DataStructuresBasics::LinkedList->new;

    # Estado vacío.
    ok($list->is_empty, 'is_empty al inicializar');
    is($list->size, 0, 'size al inicializar');
    is($list->head_value, -1, 'get_head sin nodos devuelve -1');

    # Insertar por ambos extremos.
    $list->insert_tail(10);
    $list->insert_tail(20);
    $list->insert_head(5);
    $list->insert_tail(10);
    is($list->size, 4, 'size tras cuatro inserciones');
    is_deeply([ list_values($list) ], [ 5, 10, 20, 10 ], 'recorrido desde get_head');

    # Eliminar la primera aparición.
    ok($list->delete(10), 'delete(10) tiene éxito');
    is_deeply([ list_values($list) ], [ 5, 20, 10 ], 'recorrido tras delete(10)');
    is($list->size, 3, 'size tras delete(10)');

    # Valor ausente.
    ok(!$list->delete(99), 'delete(99) falla');
    is_deeply([ list_values($list) ], [ 5, 20, 10 ], 'el recorrido no cambia');
    is($list->size, 3, 'el tamaño no cambia');

    # Vaciar.
    ok($list->delete(5), 'delete(5) tiene éxito');
    ok($list->delete(20), 'delete(20) tiene éxito');
    ok($list->delete(10), 'delete(10) tiene éxito');
    ok($list->is_empty, 'is_empty tras vaciar');
    is($list->size, 0, 'size tras vaciar');
    is($list->head_value, -1, 'get_head tras vaciar devuelve -1');
};

subtest 'Stack' => sub {
    my $stack = DataStructuresBasics::Stack->new;

    # Estado vacío y extracción fallida.
    ok($stack->is_empty, 'is_empty al inicializar');
    is($stack->size, 0, 'size al inicializar');
    is($stack->peek, -1, 'peek con la pila vacía');
    is($stack->pop, -1, 'pop con la pila vacía');

    # LIFO y peek no mutante.
    $stack->push(10);
    $stack->push(20);
    $stack->push(30);
    is($stack->peek, 30, 'peek devuelve el tope');
    is($stack->size, 3, 'size tras tres push');

    # Extracción y reutilización.
    is($stack->pop, 30, 'pop devuelve 30');
    $stack->push(40);
    is($stack->pop, 40, 'pop devuelve 40');
    is($stack->pop, 20, 'pop devuelve 20');
    is($stack->pop, 10, 'pop devuelve 10');
    ok($stack->is_empty, 'is_empty tras extraer todo');
    is($stack->size, 0, 'size tras extraer todo');

    # Vacío tras extracción.
    is($stack->pop, -1, 'pop en vacío falla');
    ok($stack->is_empty, 'is_empty sigue siendo cierto');
};

subtest 'Queue' => sub {
    my $queue = DataStructuresBasics::Queue->new;

    # Estado vacío y extracción fallida.
    ok($queue->is_empty, 'is_empty al inicializar');
    is($queue->size, 0, 'size al inicializar');
    is($queue->peek, -1, 'peek con la cola vacía');
    is($queue->dequeue, -1, 'dequeue con la cola vacía');

    # FIFO y peek no mutante.
    $queue->enqueue(10);
    $queue->enqueue(20);
    $queue->enqueue(30);
    is($queue->peek, 10, 'peek devuelve el frente');
    is($queue->size, 3, 'size tras tres enqueue');

    # Extracción y reutilización.
    is($queue->dequeue, 10, 'dequeue devuelve 10');
    $queue->enqueue(40);
    is($queue->dequeue, 20, 'dequeue devuelve 20');
    is($queue->dequeue, 30, 'dequeue devuelve 30');
    is($queue->dequeue, 40, 'dequeue devuelve 40');
    ok($queue->is_empty, 'is_empty tras extraer todo');
    is($queue->size, 0, 'size tras extraer todo');

    # Vacío tras extracción.
    is($queue->dequeue, -1, 'dequeue en vacío falla');
    ok($queue->is_empty, 'is_empty sigue siendo cierto');
};

done_testing;

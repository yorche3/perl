package DataStructuresBasics::Stack;
use v5.36;
use Moo;

use DataStructuresBasics::Node;

# DataStructuresBasics::Stack — pila LIFO construida a mano sobre Node.
#
# Especificación: 06_Data_Structures_Basics
#
# Implementación sobre el contrato del paso 4b: estado y operaciones.
#
# Adecuaciones: `new` es el `init`; `pop` y `peek` devuelven -1 con la pila
# vacía, e `is_empty` y `size` devuelven 0. Ojo al implementar: dentro del
# paquete `push` y `pop` son métodos, así que el builtin queda como
# `CORE::push` y `CORE::pop`.

has top   => (is => 'rw', default => sub { undef });
has count => (is => 'rw', default => sub { 0 });

# Apila el valor sobre el tope (push).
sub push {
    my ($self, $value) = @_;
    my $node = DataStructuresBasics::Node->new(value => $value);
    $node->next($self->top);
    $self->top($node);
    $self->count($self->count + 1);
    return;
}

# Extrae el tope, o -1 cuando la pila está vacía (pop).
sub pop {
    my ($self) = @_;
    return -1 if $self->is_empty;
    my $node = $self->top;
    $self->top($node->next);
    $self->count($self->count - 1);
    return $node->value;
}

# Observa el tope sin extraerlo, o -1 cuando la pila está vacía (peek).
sub peek {
    my ($self) = @_;
    return -1 if $self->is_empty;
    return $self->top->value;
}

# Informa si la pila no tiene nodos (is_empty).
sub is_empty {
    my ($self) = @_;
    return $self->count == 0;
}

# Número de nodos de la pila (size).
sub size {
    my ($self) = @_;
    return $self->count;
}

1;

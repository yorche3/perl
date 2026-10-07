package DataStructuresBasics::Queue;
use v5.36;
use Moo;

use DataStructuresBasics::Node;

# DataStructuresBasics::Queue — cola FIFO construida a mano sobre Node.
#
# Especificación: 06_Data_Structures_Basics
#
# Implementación sobre el contrato del paso 4b: estado y operaciones.
#
# Adecuaciones: `new` es el `init`; `dequeue` y `peek` devuelven -1 con la cola
# vacía, e `is_empty` y `size` devuelven 0.

has front => (is => 'rw', default => sub { undef });
has rear  => (is => 'rw', default => sub { undef });
has count => (is => 'rw', default => sub { 0 });

# Añade el valor por el final de la cola (enqueue).
sub enqueue {
    my ($self, $value) = @_;
    my $node = DataStructuresBasics::Node->new(value => $value);
    if ($self->is_empty) {
        $self->front($node);
        $self->rear($node);
    } else {
        $self->rear->next($node);
        $self->rear($node);
    }
    $self->count($self->count + 1);
    return;
}

# Extrae el frente, o -1 cuando la cola está vacía (dequeue).
sub dequeue {
    my ($self) = @_;
    return -1 if $self->is_empty;
    my $node = $self->front;
    $self->front($node->next);
    $self->count($self->count - 1);
    return $node->value;
}

# Observa el frente sin extraerlo, o -1 cuando la cola está vacía (peek).
sub peek {
    my ($self) = @_;
    return -1 if $self->is_empty;
    return $self->front->value;
}

# Informa si la cola no tiene nodos (is_empty).
sub is_empty {
    my ($self) = @_;
    return $self->count == 0;
}

# Número de nodos de la cola (size).
sub size {
    my ($self) = @_;
    return $self->count;
}

1;

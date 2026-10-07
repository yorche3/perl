package DataStructuresBasics::Queue;
use v5.36;
use Moo;

use DataStructuresBasics::Node;

# DataStructuresBasics::Queue — cola FIFO construida a mano sobre Node.
#
# Especificación: 06_Data_Structures_Basics
#
# Contrato del paso 4b: estado y esqueletos de las operaciones; el algoritmo es
# del paso 5 y la suite, del 4c.
#
# Adecuaciones: `new` es el `init`; `dequeue` y `peek` devuelven -1 con la cola
# vacía, e `is_empty` y `size` devuelven 0.

has front => (is => 'rw', default => sub { undef });
has rear  => (is => 'rw', default => sub { undef });
has count => (is => 'rw', default => sub { 0 });

# Añade el valor por el final de la cola (enqueue).
sub enqueue {
    my ($self, $value) = @_;
    return;
}

# Extrae el frente, o -1 cuando la cola está vacía (dequeue).
sub dequeue {
    my ($self) = @_;
    return -1;
}

# Observa el frente sin extraerlo, o -1 cuando la cola está vacía (peek).
sub peek {
    my ($self) = @_;
    return -1;
}

# Informa si la cola no tiene nodos (is_empty).
sub is_empty {
    my ($self) = @_;
    return 0;
}

# Número de nodos de la cola (size).
sub size {
    my ($self) = @_;
    return 0;
}

1;

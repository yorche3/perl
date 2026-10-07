package DataStructuresBasics::LinkedList;
use v5.36;
use Moo;

use DataStructuresBasics::Node;

# DataStructuresBasics::LinkedList — lista enlazada construida a mano sobre Node.
#
# Especificación: 06_Data_Structures_Basics
#
# Implementación sobre el contrato del paso 4b: estado, accesor de lectura y
# operaciones.
#
# Adecuaciones: `new` es el `init`; `head_value` es el `get_head` del contrato
# (el accesor `head` devuelve el nodo) y devuelve -1 con la lista vacía; `delete`
# devuelve 0 cuando el valor no está; `is_empty` y `size` devuelven 0.

has head  => (is => 'rw', default => sub { undef });
has tail  => (is => 'rw', default => sub { undef });
has count => (is => 'rw', default => sub { 0 });

# Valor de la cabeza, o -1 cuando la lista está vacía (get_head).
sub head_value {
    my ($self) = @_;
    return defined $self->head ? $self->head->value : -1;
}

# Inserta el valor al principio de la lista (insert_head).
sub insert_head {
    my ($self, $value) = @_;
    my $node = DataStructuresBasics::Node->new(value => $value);
    $node->next($self->head);
    $self->head($node);
    $self->tail($node) unless defined $self->tail;
    $self->count($self->count + 1);
}

# Inserta el valor al final de la lista (insert_tail).
sub insert_tail {
    my ($self, $value) = @_;
    my $node = DataStructuresBasics::Node->new(value => $value);
    if (defined $self->tail) {
        $self->tail->next($node);
        $self->tail($node);
    } else {
        $self->head($node);
        $self->tail($node);
    }
    $self->count($self->count + 1);
}

# Elimina la primera aparición del valor (delete): 0 cuando no está.
sub delete {
    my ($self, $value) = @_;
    my $prev;
    my $curr = $self->head;
    while ($curr) {
        if ($curr->value == $value) {
            if ($prev) {
                $prev->next($curr->next);
            } else {
                $self->head($curr->next);
            }
            $self->tail($prev) unless $curr->next;
            $self->count($self->count - 1);
            return 1;
        }
        $prev = $curr;
        $curr = $curr->next;
    }
    return 0;
}

# Informa si la lista no tiene nodos (is_empty).
sub is_empty {
    my ($self) = @_;
    return $self->count == 0;
}

# Número de nodos de la lista (size).
sub size {
    my ($self) = @_;
    return $self->count;
}

1;

package DataStructuresBasics::Node;
use v5.36;
use Moo;

# DataStructuresBasics::Node — celda enlazada compartida por LinkedList, Stack
# y Queue.
#
# Especificación: 06_Data_Structures_Basics
#
# Contrato del paso 4b: tipo nuevo y accesores.
#
# Adecuaciones: `new` (el que genera Moo) es el `init` del contrato —`value` es
# de solo lectura y `next` se enlaza con su accesor `rw`, que es el `set_next`—.
# Solo el enlace de un Node puede ser `undef`; el resto de las operaciones
# devuelve -1 (números) o 0 (banderas y contadores).

has value => (is => 'ro', required => 1);
has next  => (is => 'rw', default => sub { undef });

1;

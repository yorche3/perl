# Data Structures Basics — Perl

Implementación de la especificación [06_Data_Structures_Basics](../../../../docs/core/algorithms/06_Data_Structures_Basics.md) en **Perl 5.36+**, con un enfoque manual y minimalista usando Moo.

**ES:** Implementación de `Node`, `LinkedList`, `Stack` y `Queue` sobre el mismo tipo de nodo enlazado, con pruebas unitarias mediante Test2::Bundle::More.

**EN:** Implementation of `Node`, `LinkedList`, `Stack` and `Queue` over the same linked node type, with unit tests using Test2::Bundle::More.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| `lib/DataStructuresBasics/Node.pm` | Celda enlazada compartida por las tres estructuras / Linked cell shared by the three structures |
| `lib/DataStructuresBasics/LinkedList.pm` | Lista enlazada manual con cabeza, cola y contador / Manual linked list with head, tail and count |
| `lib/DataStructuresBasics/Stack.pm` | Pila LIFO independiente sobre `Node` / Independent LIFO stack over `Node` |
| `lib/DataStructuresBasics/Queue.pm` | Cola FIFO independiente sobre `Node` / Independent FIFO queue over `Node` |
| `test/data_structures_basics_tests.pl` | Suite de pruebas unitarias / Unit test suite |

**ES:** La especificación propone `src/` y `test/run_tests.ext`, pero el layout real sigue la convención de Perl: módulos en `lib/` con nombres de paquete jerárquicos (`DataStructuresBasics::Node`) y pruebas en `test/`. No hay script `run_tests`; las pruebas se ejecutan directamente con `perl -Ilib test/data_structures_basics_tests.pl`.

**EN:** The specification proposes `src/` and `test/run_tests.ext`, but the real layout follows Perl conventions: modules in `lib/` with hierarchical package names (`DataStructuresBasics::Node`) and tests in `test/`. There is no `run_tests` script; tests run directly with `perl -Ilib test/data_structures_basics_tests.pl`.

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Proyecto creado manualmente con `mkdir -p lib test`, sin herramientas de scaffolding. Los módulos usan **Moo** —la única dependencia externa— para declarar atributos y accesores. La construcción es innecesaria: Perl compila en tiempo de ejecución.

**EN:** Project created by hand with `mkdir -p lib test`, without scaffolding tools. Modules use **Moo** —the only external dependency— to declare attributes and accessors. Build is unnecessary: Perl compiles at runtime.

## 📄 Configuración clave / Key Configuration

**ES:** No hay archivos de configuración ni manifiestos. Las dependencias son **Moo** (los módulos) y **Test2::Suite** (`Test2::Bundle::More`, la suite); ninguna más. Se instalan con **el mismo intérprete que ejecuta las pruebas** y sin `sudo`: `cpan -i Moo` y `cpan -i Test2::Suite` (con el Perl de Homebrew, `cpanm`, que llega con `brew install cpanminus`). `sudo cpan` instalaría en el Perl del sistema y luego `prove` no encontraría los módulos.

**EN:** There are no configuration files or manifests. The dependencies are **Moo** (the modules) and **Test2::Suite** (`Test2::Bundle::More`, the suite); no others. Install them with **the same interpreter that runs the tests** and without `sudo`: `cpan -i Moo` and `cpan -i Test2::Suite` (with Homebrew's Perl, `cpanm`, installed by `brew install cpanminus`). `sudo cpan` would install into the system Perl and then `prove` would not find the modules.

## 🚀 Compilación y ejecución / Build & Run

```bash
perl -Ilib -c lib/DataStructuresBasics/Node.pm
perl -Ilib -c lib/DataStructuresBasics/LinkedList.pm
perl -Ilib -c lib/DataStructuresBasics/Stack.pm
perl -Ilib -c lib/DataStructuresBasics/Queue.pm
perl -Ilib test/data_structures_basics_tests.pl
```

**Salida real / Actual output:**

```text
lib/DataStructuresBasics/Node.pm syntax OK
lib/DataStructuresBasics/LinkedList.pm syntax OK
lib/DataStructuresBasics/Stack.pm syntax OK
lib/DataStructuresBasics/Queue.pm syntax OK
# Subtest: Node
    ok 1 - init asigna el valor 10
    ok 2 - el enlace inicial es ausente
    ok 3 - get_value(get_next(a)) = 20
    ok 4 - el siguiente de b es ausente
    1..4
ok 1 - Subtest: Node
# Subtest: LinkedList
    ok 1 - is_empty al inicializar
    ok 2 - size al inicializar
    ok 3 - get_head sin nodos devuelve -1
    ok 4 - size tras cuatro inserciones
    ok 5 - recorrido desde get_head
    ok 6 - delete(10) tiene éxito
    ok 7 - recorrido tras delete(10)
    ok 8 - size tras delete(10)
    ok 9 - delete(99) falla
    ok 10 - el recorrido no cambia
    ok 11 - el tamaño no cambia
    ok 12 - delete(5) tiene éxito
    ok 13 - delete(20) tiene éxito
    ok 14 - delete(10) tiene éxito
    ok 15 - is_empty tras vaciar
    ok 16 - size tras vaciar
    ok 17 - get_head tras vaciar devuelve -1
    1..17
ok 2 - Subtest: LinkedList
# Subtest: Stack
    ok 1 - is_empty al inicializar
    ok 2 - size al inicializar
    ok 3 - peek con la pila vacía
    ok 4 - pop con la pila vacía
    ok 5 - peek devuelve el tope
    ok 6 - size tras tres push
    ok 7 - pop devuelve 30
    ok 8 - pop devuelve 40
    ok 9 - pop devuelve 20
    ok 10 - pop devuelve 10
    ok 11 - is_empty tras extraer todo
    ok 12 - size tras extraer todo
    ok 13 - pop en vacío falla
    ok 14 - is_empty sigue siendo cierto
    1..14
ok 3 - Subtest: Stack
# Subtest: Queue
    ok 1 - is_empty al inicializar
    ok 2 - size al inicializar
    ok 3 - peek con la cola vacía
    ok 4 - dequeue con la cola vacía
    ok 5 - peek devuelve el frente
    ok 6 - size tras tres enqueue
    ok 7 - dequeue devuelve 10
    ok 8 - dequeue devuelve 20
    ok 9 - dequeue devuelve 30
    ok 10 - dequeue devuelve 40
    ok 11 - is_empty tras extraer todo
    ok 12 - size tras extraer todo
    ok 13 - dequeue en vacío falla
    ok 14 - is_empty sigue siendo cierto
    1..14
ok 4 - Subtest: Queue
1..4
```

**ES:** 4 subtests y 49 aserciones (Node 4, LinkedList 17, Stack 14, Queue 14).
**EN:** 4 subtests and 49 assertions (Node 4, LinkedList 17, Stack 14, Queue 14).

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node->new(value => $v)` | `value → Node` | `O(1)` | `init` idiomático de Moo; `next` es `undef` / Idiomatic Moo `init`; `next` is `undef` |
| `$node->value` | `Node → value` | `O(1)` | Accesor de solo lectura / Read-only accessor |
| `$node->next` | `Node → Node?` | `O(1)` | Accesor de lectura/escritura; `undef` si no hay enlace / Read-write accessor; `undef` if no link |
| `$node->next($other)` | `Node? → Node` | `O(1)` | `set_next` idiomático; devuelve el valor asignado (el nodo enlazado) / Idiomatic `set_next`; returns the assigned value (the linked node) |
| `LinkedList->new` | `→ LinkedList` | `O(1)` | `init` idiomático; cabeza y cola ausentes (`undef`) y contador a cero / Idiomatic `init`; head and tail absent (`undef`) and count zero |
| `$list->head_value` | `LinkedList → value` | `O(1)` | `get_head` del contrato; `-1` si está vacía / Contract `get_head`; `-1` if empty |
| `$list->insert_head($v)` | `value → void` | `O(1)` | Inserta al principio; actualiza cabeza y cola si estaba vacía / Inserts at head; updates head and tail if empty |
| `$list->insert_tail($v)` | `value → void` | `O(1)` | Inserta al final; actualiza cabeza y cola / Inserts at tail; updates head and tail |
| `$list->delete($v)` | `value → bool` | `O(n)` | Elimina la primera aparición; devuelve `1` en éxito, `0` si no está / Deletes first occurrence; returns `1` on success, `0` if absent |
| `$list->is_empty` | `LinkedList → bool` | `O(1)` | `true` si el contador es cero / `true` if count is zero |
| `$list->size` | `LinkedList → int` | `O(1)` | Número de nodos / Number of nodes |
| `Stack->new` | `→ Stack` | `O(1)` | `init` idiomático; tope ausente (`undef`) y contador a cero / Idiomatic `init`; top absent (`undef`) and count zero |
| `$stack->push($v)` | `value → void` | `O(1)` | Coloca el valor sobre el tope / Places value on top |
| `$stack->pop` | `Stack → value` | `O(1)` | Extrae el tope; `-1` si está vacía / Pops top; `-1` if empty |
| `$stack->peek` | `Stack → value` | `O(1)` | Observa el tope sin extraerlo; `-1` si está vacía / Peeks top without popping; `-1` if empty |
| `$stack->is_empty` | `Stack → bool` | `O(1)` | `true` si el contador es cero / `true` if count is zero |
| `$stack->size` | `Stack → int` | `O(1)` | Número de nodos / Number of nodes |
| `Queue->new` | `→ Queue` | `O(1)` | `init` idiomático; frente y final ausentes (`undef`) y contador a cero / Idiomatic `init`; front and rear absent (`undef`) and count zero |
| `$queue->enqueue($v)` | `value → void` | `O(1)` | Añade por el final / Adds at rear |
| `$queue->dequeue` | `Queue → value` | `O(1)` | Extrae el frente; `-1` si está vacía / Dequeues front; `-1` if empty |
| `$queue->peek` | `Queue → value` | `O(1)` | Observa el frente sin extraerlo; `-1` si está vacía / Peeks front without dequeuing; `-1` if empty |
| `$queue->is_empty` | `Queue → bool` | `O(1)` | `true` si el contador es cero / `true` if count is zero |
| `$queue->size` | `Queue → int` | `O(1)` | Número de nodos / Number of nodes |

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Usar Moo para atributos y accesores | Clases manuales con `bless` y accesores explícitos | Moo reduce código repetitivo y mantiene la claridad del contrato; la alternativa manual añade complejidad sin beneficio educativo en este módulo / Moo reduces boilerplate and keeps the contract clear; manual alternative adds complexity without educational benefit in this module |
| `head_value` como método separado del accesor `head` | Devolver el nodo completo desde `head` y extraer el valor en el cliente | El contrato especifica `get_head` que devuelve el valor, no el nodo; `head` queda como accesor interno para el recorrido / Contract specifies `get_head` returning the value, not the node; `head` remains as internal accessor for traversal |
| `delete` devuelve booleano (`1`/`0`) | Devolver el valor eliminado o `-1` en fallo | El contrato especifica "éxito" o "fallo" sin valor; el booleano es el indicador natural de Perl para operaciones con efecto secundario / Contract specifies "success" or "failure" without value; boolean is Perl's natural indicator for side-effect operations |

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init(value)` para `Node` | `Node->new(value => $v)` | Moo genera `new` como constructor idiomático; `value` es atributo requerido y `next` tiene valor por defecto `undef` / Moo generates `new` as idiomatic constructor; `value` is required attribute and `next` defaults to `undef` |
| `init()` para `LinkedList`, `Stack`, `Queue` | `LinkedList->new`, `Stack->new`, `Queue->new` | Moo genera `new` sin argumentos; los atributos tienen valores por defecto (`undef` para enlaces, `0` para contadores) / Moo generates `new` without arguments; attributes have default values (`undef` for links, `0` for counts) |
| `get_value()`, `get_next()` | `$node->value`, `$node->next` | Perl usa accesores como métodos sin paréntesis; Moo los genera automáticamente / Perl uses accessors as methods without parentheses; Moo generates them automatically |
| `set_next(next)` | `$node->next($other)` | El accesor `rw` de Moo acepta un argumento para modificar el valor; devuelve el nodo modificado / Moo `rw` accessor accepts an argument to modify the value; returns the modified node |
| `get_head()` | `$list->head_value` | El accesor `head` devuelve el nodo; `head_value` es un método adicional que extrae el valor o devuelve `-1` / `head` accessor returns the node; `head_value` is an additional method that extracts the value or returns `-1` |
| Ausencia de enlace con `null`/`nil` | `undef` | Perl usa `undef` como valor no definido; es la representación nativa de ausencia / Perl uses `undef` as undefined value; it is the native representation of absence |
| Layout `src/` y `test/run_tests.ext` | `lib/` y `test/data_structures_basics_tests.pl` | Convención de Perl: módulos en `lib/` con nombres de paquete jerárquicos; pruebas ejecutables directamente sin script intermedio / Perl convention: modules in `lib/` with hierarchical package names; tests executable directly without intermediate script |

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `head_value` | Lista vacía | `-1` | `$list->head_value` devuelve `-1` tras `init` / returns `-1` after `init` |
| `delete` | Valor no está en la lista | `0` | `$list->delete(99)` devuelve `0` / returns `0` |
| `pop` | Pila vacía | `-1` | `$stack->pop` devuelve `-1` tras `init` / returns `-1` after `init` |
| `peek` (Stack) | Pila vacía | `-1` | `$stack->peek` devuelve `-1` / returns `-1` |
| `dequeue` | Cola vacía | `-1` | `$queue->dequeue` devuelve `-1` tras `init` / returns `-1` after `init` |
| `peek` (Queue) | Cola vacía | `-1` | `$queue->peek` devuelve `-1` / returns `-1` |
| `is_empty` | No aplica | `1` (verdadero) | Devuelve `1` cuando el contador es cero / Returns `1` when count is zero |
| `size` | No aplica | `0` | Devuelve `0` tras `init` / Returns `0` after `init` |

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| **Node**: inicializar y observar valor/enlace | Sí | `data_structures_basics_tests.pl:44-45` | Verifica `value` y `next` tras `new` / Verifies `value` and `next` after `new` |
| **Node**: inicializar otro nodo, enlazar y recorrer | Sí | `data_structures_basics_tests.pl:49-50` | Verifica `get_value(get_next(a))` y enlace de `b` / Verifies `get_value(get_next(a))` and `b`'s link |
| **LinkedList**: estado vacío | Sí | `data_structures_basics_tests.pl:57-59` | `is_empty`, `size`, `head_value` tras `new` / `is_empty`, `size`, `head_value` after `new` |
| **LinkedList**: insertar por ambos extremos | Sí | `data_structures_basics_tests.pl:66-67` | Cuatro inserciones y recorrido completo / Four insertions and full traversal |
| **LinkedList**: eliminar primera aparición | Sí | `data_structures_basics_tests.pl:70-72` | `delete(10)` y verificación de recorrido y tamaño / `delete(10)` and traversal and size verification |
| **LinkedList**: valor ausente | Sí | `data_structures_basics_tests.pl:75-77` | `delete(99)` falla sin cambiar estado / `delete(99)` fails without changing state |
| **LinkedList**: vaciar | Sí | `data_structures_basics_tests.pl:80-85` | Tres `delete` exitosos y verificación de vacío / Three successful `delete`s and empty verification |
| **Stack**: estado vacío y extracción fallida | Sí | `data_structures_basics_tests.pl:92-95` | `is_empty`, `size`, `peek`, `pop` tras `new` / `is_empty`, `size`, `peek`, `pop` after `new` |
| **Stack**: LIFO y `peek` no mutante | Sí | `data_structures_basics_tests.pl:101-102` | Tres `push` y verificación de `peek` y `size` / Three `push`es and `peek` and `size` verification |
| **Stack**: extracción y reutilización | Sí | `data_structures_basics_tests.pl:105-111` | `pop`, `push`, tres `pop` y verificación de vacío / `pop`, `push`, three `pop`s and empty verification |
| **Stack**: vacío tras extracción | Sí | `data_structures_basics_tests.pl:114-115` | `pop` devuelve `-1` y `is_empty` sigue verdadero / `pop` returns `-1` and `is_empty` remains true |
| **Queue**: estado vacío y extracción fallida | Sí | `data_structures_basics_tests.pl:122-125` | `is_empty`, `size`, `peek`, `dequeue` tras `new` / `is_empty`, `size`, `peek`, `dequeue` after `new` |
| **Queue**: FIFO y `peek` no mutante | Sí | `data_structures_basics_tests.pl:131-132` | Tres `enqueue` y verificación de `peek` y `size` / Three `enqueue`s and `peek` and `size` verification |
| **Queue**: extracción y reutilización | Sí | `data_structures_basics_tests.pl:135-141` | `dequeue`, `enqueue`, tres `dequeue` y verificación de vacío / `dequeue`, `enqueue`, three `dequeue`s and empty verification |
| **Queue**: vacío tras extracción | Sí | `data_structures_basics_tests.pl:144-145` | `dequeue` devuelve `-1` y `is_empty` sigue verdadero / `dequeue` returns `-1` and `is_empty` remains true |

## ⚠️ Limitaciones conocidas / Known limitations

Ninguna / None

**ES:** El módulo implementa completamente el contrato de la especificación sin limitaciones impuestas por el lenguaje o la fase. Perl soporta mutación, enlaces `undef` y operaciones manuales sobre nodos sin restricciones.

**EN:** The module fully implements the specification contract without limitations imposed by the language or phase. Perl supports mutation, `undef` links and manual node operations without restrictions.

## 📝 Notas de implementación / Implementation Notes

**ES:** Perl usa Moo para la declaración de clases y atributos. `new` es el constructor idiomático generado por Moo, equivalente al `init` del contrato. Los atributos `ro` (solo lectura) y `rw` (lectura/escritura) generan accesores automáticos. `undef` es la representación nativa de ausencia para enlaces. Los valores de retorno `-1` y `0` son indicadores de fallo numéricos; `delete` devuelve booleano (`1`/`0`) porque el contrato especifica éxito/fallo sin valor. `push` y `pop` son métodos del paquete, así que los builtins de Perl quedan como `CORE::push` y `CORE::pop` (aunque no se usan en esta implementación). Las pruebas usan Test2::Bundle::More y verifican el contrato observando solo operaciones públicas, no campos internos.

**EN:** Perl uses Moo for class and attribute declaration. `new` is the idiomatic constructor generated by Moo, equivalent to the contract's `init`. `ro` (read-only) and `rw` (read-write) attributes generate automatic accessors. `undef` is the native representation of absence for links. Return values `-1` and `0` are numeric failure indicators; `delete` returns boolean (`1`/`0`) because the contract specifies success/failure without value. `push` and `pop` are package methods, so Perl's builtins remain as `CORE::push` and `CORE::pop` (though not used in this implementation). Tests use Test2::Bundle::More and verify the contract by observing only public operations, not internal fields.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_.
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`06_Data_Structures_Basics.md`](../../../../docs/core/algorithms/06_Data_Structures_Basics.md) |
| Módulo homologado del lenguaje / Homologated module | [`perl/core/foundations/numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [https://perldoc.perl.org/](https://perldoc.perl.org/) |
| Moo (minimal object orientation) | [https://metacpan.org/pod/Moo](https://metacpan.org/pod/Moo) |

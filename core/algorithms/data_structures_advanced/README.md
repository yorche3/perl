# Data Structures Advanced — Perl

Implementación de la especificación [07_Data_Structures_Advanced](../../../../docs/core/algorithms/07_Data_Structures_Advanced.md) en **Perl 5.36+**, con un enfoque manual y minimalista usando orientación a objetos nativa (`bless` y `use parent`).

**ES:** Implementación de `Node`, `TreeNode`, `BinaryTree`, `GraphNode` y `Graph` con herencia directa sobre la base con valor, registro enlazado canónico de vértices y pruebas unitarias con Test2::Bundle::More.

**EN:** Implementation of `Node`, `TreeNode`, `BinaryTree`, `GraphNode` and `Graph` with direct inheritance from the value base, canonical linked vertex registry and unit tests with Test2::Bundle::More.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| `lib/data_structures_advanced.pl` | Punto de entrada del paquete contenedor `DataStructuresAdvanced` / Container package entry point |
| `lib/DataStructuresAdvanced/Node.pm` | Clase base `Node` con valor, sin enlaces ni validaciones / Base `Node` class holding value only |
| `lib/DataStructuresAdvanced/TreeNode.pm` | Nodo de árbol binario con enlaces `left` y `right` mutables / Binary tree node with mutable `left` and `right` links |
| `lib/DataStructuresAdvanced/BinaryTree.pm` | Árbol binario de búsqueda (ABB) iterativo no acotado / Unbounded iterative binary search tree (BST) |
| `lib/DataStructuresAdvanced/GraphNode.pm` | Nodo interno de grafo con adyacencia y puntero `next_vertex` / Internal graph node with adjacency and `next_vertex` pointer |
| `lib/DataStructuresAdvanced/Graph.pm` | Grafo dirigido con registro enlazado propio y adyacencia ordenada / Directed graph with own linked registry and sorted adjacency |
| `test/data_structures_advanced_tests.pl` | Suite de pruebas unitarias / Unit test suite |

**ES:** La especificación propone `src/` y `test/run_tests.ext`, pero el layout real sigue la convención de Perl: módulos en `lib/` con nombres de paquete jerárquicos (`DataStructuresAdvanced::*`) y pruebas en `test/`. No hay script `run_tests`; las pruebas se ejecutan directamente con `perl -Ilib test/data_structures_advanced_tests.pl` o con el harness `prove`.

**EN:** The specification proposes `src/` and `test/run_tests.ext`, but the real layout follows Perl conventions: modules in `lib/` with hierarchical package names (`DataStructuresAdvanced::*`) and tests in `test/`. There is no `run_tests` script; tests run directly with `perl -Ilib test/data_structures_advanced_tests.pl` or with the `prove` harness.

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Proyecto creado manualmente con estructura `lib/` y `test/`, sin herramientas de scaffolding externas. A diferencia de `data_structures_basics` (que empleó Moo), este módulo utiliza orientación a objetos nativa de Perl mediante tablas hash bendecidas (`bless`) y herencia estándar (`use parent`). No requiere dependencias externas de ejecución. La construcción es innecesaria ya que Perl interpreta y compila en tiempo de ejecución.

**EN:** Project created manually with `lib/` and `test/` layout, without external scaffolding tools. Unlike `data_structures_basics` (which used Moo), this module uses native Perl object orientation via blessed hash references (`bless`) and standard inheritance (`use parent`). It requires no external runtime dependencies. Compilation build is unnecessary as Perl interprets and compiles at runtime.

## 📄 Configuración clave / Key Configuration

**ES:** No hay archivos de configuración ni manifiestos de build. Las dependencias en tiempo de ejecución son cero (solo módulos core de Perl). La única dependencia para ejecutar las pruebas es la suite estándar **Test2::Suite** (`Test2::Bundle::More`), disponible en entornos Perl modernos o instalable vía `cpan -i Test2::Suite`.

**EN:** There are no build configuration files or manifests. Runtime dependencies are zero (standard core Perl only). The sole test dependency is the standard **Test2::Suite** (`Test2::Bundle::More`), available in modern Perl distributions or installable via `cpan -i Test2::Suite`.

## 🚀 Compilación y ejecución / Build & Run

```bash
perl -Ilib -c lib/DataStructuresAdvanced/Node.pm
perl -Ilib -c lib/DataStructuresAdvanced/TreeNode.pm
perl -Ilib -c lib/DataStructuresAdvanced/GraphNode.pm
perl -Ilib -c lib/DataStructuresAdvanced/BinaryTree.pm
perl -Ilib -c lib/DataStructuresAdvanced/Graph.pm
perl -Ilib test/data_structures_advanced_tests.pl
```

**Salida real / Actual output:**

```text
lib/DataStructuresAdvanced/Node.pm syntax OK
lib/DataStructuresAdvanced/TreeNode.pm syntax OK
lib/DataStructuresAdvanced/GraphNode.pm syntax OK
lib/DataStructuresAdvanced/BinaryTree.pm syntax OK
lib/DataStructuresAdvanced/Graph.pm syntax OK
# Subtest: TreeNode
    ok 1 - Crear un nodo de árbol: get_value() should be 10
    ok 2 - Enlaces iniciales ausentes: get_left() should be absent
    ok 3 - Enlaces iniciales ausentes: get_right() should be absent
    ok 4 - Enlazar dos hijos: left value should be 20
    ok 5 - Enlazar dos hijos: right value should be 30
    ok 6 - Recorrer cada enlace: left child should lead to 20
    ok 7 - Recorrer cada enlace: right child should lead to 30
    ok 8 - Recorrer cada enlace: left child get_left() should be absent
    ok 9 - Recorrer cada enlace: left child get_right() should be absent
    ok 10 - Recorrer cada enlace: right child get_left() should be absent
    ok 11 - Recorrer cada enlace: right child get_right() should be absent
    ok 12 - Desenlazar hijos: left should be absent after clearing left
    ok 13 - Desenlazar hijos: value should stay 10 after clearing left
    ok 14 - Desenlazar hijos: right child should stay 30 after clearing left
    ok 15 - Desenlazar hijos: left should be absent after clearing right
    ok 16 - Desenlazar hijos: right should be absent after clearing right
    ok 17 - Desenlazar hijos: value should stay 10 after clearing right
    1..17
ok 1 - Subtest: TreeNode
# Subtest: BinaryTree
    ok 1 - Crear vacío: is_empty should be true
    ok 2 - Crear vacío: size should be 0
    ok 3 - Crear vacío: contains(50) should fail
    ok 4 - Insertar la raíz: insert(50) should succeed
    ok 5 - Insertar la raíz: size should be 1
    ok 6 - Insertar la raíz: is_empty should be false
    ok 7 - Insertar la raíz: contains(50) should succeed
    ok 8 - Insertar menor y mayor: insert(50) should succeed
    ok 9 - Insertar menor y mayor: insert(30) should succeed
    ok 10 - Insertar menor y mayor: insert(70) should succeed
    ok 11 - Insertar menor y mayor: size should be 3
    ok 12 - Insertar menor y mayor: contains(50) should succeed
    ok 13 - Insertar menor y mayor: contains(30) should succeed
    ok 14 - Insertar menor y mayor: contains(70) should succeed
    ok 15 - Ramas de varios niveles: insert(50) should succeed
    ok 16 - Ramas de varios niveles: insert(30) should succeed
    ok 17 - Ramas de varios niveles: insert(70) should succeed
    ok 18 - Ramas de varios niveles: insert(20) should succeed
    ok 19 - Ramas de varios niveles: insert(40) should succeed
    ok 20 - Ramas de varios niveles: size should be 5
    ok 21 - Ramas de varios niveles: contains(50) should succeed
    ok 22 - Ramas de varios niveles: contains(30) should succeed
    ok 23 - Ramas de varios niveles: contains(70) should succeed
    ok 24 - Ramas de varios niveles: contains(20) should succeed
    ok 25 - Ramas de varios niveles: contains(40) should succeed
    ok 26 - Valor ausente en árbol no vacío: contains(99) should fail
    ok 27 - Valor ausente en árbol no vacío: size should stay 1
    ok 28 - Valor ausente en árbol no vacío: contains(50) should still succeed
    ok 29 - Duplicado idempotente: insert(50) should succeed
    ok 30 - Duplicado idempotente: insert(30) should succeed
    ok 31 - Duplicado idempotente: insert(70) should succeed
    ok 32 - Duplicado idempotente: insert(30) should succeed
    ok 33 - Duplicado idempotente: size should be 3
    ok 34 - Duplicado idempotente: contains(50) should succeed
    ok 35 - Duplicado idempotente: contains(30) should succeed
    ok 36 - Duplicado idempotente: contains(70) should succeed
    ok 37 - Inserciones ordenadas: insert(20) should succeed
    ok 38 - Inserciones ordenadas: insert(30) should succeed
    ok 39 - Inserciones ordenadas: insert(40) should succeed
    ok 40 - Inserciones ordenadas: insert(50) should succeed
    ok 41 - Inserciones ordenadas: insert(70) should succeed
    ok 42 - Inserciones ordenadas: size should be 5
    ok 43 - Inserciones ordenadas: contains(20) should succeed
    ok 44 - Inserciones ordenadas: contains(30) should succeed
    ok 45 - Inserciones ordenadas: contains(40) should succeed
    ok 46 - Inserciones ordenadas: contains(50) should succeed
    ok 47 - Inserciones ordenadas: contains(70) should succeed
    ok 48 - Inserciones ordenadas: contains(99) should fail
    1..48
ok 2 - Subtest: BinaryTree
# Subtest: Graph
    ok 1 - Crear vacío: is_empty should be true
    ok 2 - Crear vacío: vertex_count should be 0
    ok 3 - Crear vacío: edge_count should be 0
    ok 4 - Crear vacío: has_edge(10,30) should fail
    ok 5 - Crear vacío: get_neighbors(10) should fail
    ok 6 - Vértice aislado: add_vertex(10) should succeed
    ok 7 - Vértice aislado: is_empty should be false
    ok 8 - Vértice aislado: vertex_count should be 1
    ok 9 - Vértice aislado: edge_count should be 0
    ok 10 - Vértice aislado: neighbours of 10 should be empty
    ok 11 - Etiquetas no consecutivas y arista dirigida: add_vertex(10) should succeed
    ok 12 - Etiquetas no consecutivas y arista dirigida: add_vertex(70) should succeed
    ok 13 - Etiquetas no consecutivas y arista dirigida: add_edge(10,70) should succeed
    ok 14 - Etiquetas no consecutivas y arista dirigida: has_edge(10,70) should succeed
    ok 15 - Etiquetas no consecutivas y arista dirigida: has_edge(70,10) should fail
    ok 16 - Etiquetas no consecutivas y arista dirigida: vertex_count should be 2
    ok 17 - Etiquetas no consecutivas y arista dirigida: edge_count should be 1
    ok 18 - Vértice duplicado conserva adyacencia: add_edge(10,30) should succeed
    ok 19 - Vértice duplicado conserva adyacencia: duplicate add_vertex(10) should succeed
    ok 20 - Vértice duplicado conserva adyacencia: vertex_count should be 2
    ok 21 - Vértice duplicado conserva adyacencia: edge_count should be 1
    ok 22 - Vértice duplicado conserva adyacencia: neighbours of 10 should be [30]
    ok 23 - Arista duplicada: first add_edge(10,30) should succeed
    ok 24 - Arista duplicada: second add_edge(10,30) should succeed
    ok 25 - Arista duplicada: vertex_count should be 2
    ok 26 - Arista duplicada: edge_count should be 1
    ok 27 - Arista duplicada: neighbours of 10 should be [30]
    ok 28 - Extremo inexistente sin mutación: add_edge(10,99) should fail
    ok 29 - Extremo inexistente sin mutación: add_edge(99,10) should fail
    ok 30 - Extremo inexistente sin mutación: add_edge(98,99) should fail
    ok 31 - Extremo inexistente sin mutación: add_edge(99,99) should fail
    ok 32 - Extremo inexistente sin mutación: vertex_count should be 2
    ok 33 - Extremo inexistente sin mutación: edge_count should be 1
    ok 34 - Extremo inexistente sin mutación: neighbours of 10 should be [30]
    ok 35 - Extremo inexistente sin mutación: neighbours of 30 should be empty
    ok 36 - Extremo inexistente sin mutación: has_edge(10,99) should fail
    ok 37 - Extremo inexistente sin mutación: has_edge(99,10) should fail
    ok 38 - Extremo inexistente sin mutación: has_edge(98,99) should fail
    ok 39 - Extremo inexistente sin mutación: has_edge(99,99) should fail
    ok 40 - Extremo inexistente sin mutación: get_neighbors(98) should fail
    ok 41 - Extremo inexistente sin mutación: get_neighbors(99) should fail
    ok 42 - Vecinos ordenados y contadores: add_edge(10,70) should succeed
    ok 43 - Vecinos ordenados y contadores: add_edge(10,30) should succeed
    ok 44 - Vecinos ordenados y contadores: add_edge(10,50) should succeed
    ok 45 - Vecinos ordenados y contadores: add_edge(30,50) should succeed
    ok 46 - Vecinos ordenados y contadores: neighbours of 10 should be [30 50 70]
    ok 47 - Vecinos ordenados y contadores: neighbours of 30 should be [50]
    ok 48 - Vecinos ordenados y contadores: neighbours of 50 should be []
    ok 49 - Vecinos ordenados y contadores: neighbours of 70 should be []
    ok 50 - Vecinos ordenados y contadores: vertex_count should be 4
    ok 51 - Vecinos ordenados y contadores: edge_count should be 4
    ok 52 - Consulta de arista ausente: has_edge(10,30) should fail
    ok 53 - Consulta de arista ausente: vertex_count should be 2
    ok 54 - Consulta de arista ausente: edge_count should be 0
    ok 55 - Consulta de arista ausente: is_empty should be false
    ok 56 - Vecinos de vértice inexistente: get_neighbors(99) should fail
    ok 57 - Vecinos de vértice inexistente: neighbours of 10 should be empty, not failure
    ok 58 - Vecinos de vértice inexistente: vertex_count should be 1
    ok 59 - Vecinos de vértice inexistente: edge_count should be 0
    ok 60 - Bucle y duplicado: first add_edge(10,10) should succeed
    ok 61 - Bucle y duplicado: second add_edge(10,10) should succeed
    ok 62 - Bucle y duplicado: has_edge(10,10) should succeed
    ok 63 - Bucle y duplicado: neighbours of 10 should be [10]
    ok 64 - Bucle y duplicado: vertex_count should be 1
    ok 65 - Bucle y duplicado: edge_count should be 1
    ok 66 - Aislamiento del resultado de vecinos: changing a returned copy should not change the graph
    ok 67 - Aislamiento del resultado de vecinos: saved result should remain [30]
    ok 68 - Aislamiento del resultado de vecinos: fresh query should be [30,50]
    ok 69 - Aislamiento del resultado de vecinos: vertex_count should be 3
    ok 70 - Aislamiento del resultado de vecinos: edge_count should be 2
    1..70
ok 3 - Subtest: Graph
1..3
```

**ES:** 3 subtests y 135 aserciones (`TreeNode` 17, `BinaryTree` 48, `Graph` 70).
**EN:** 3 subtests and 135 assertions (`TreeNode` 17, `BinaryTree` 48, `Graph` 70).

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node->new(value => $v)` | `value → Node` | `O(1)` | Base local con solo el valor; sin enlaces ni validaciones / Local base carrying value only; no links or validations |
| `$node->value` | `Node → value` | `O(1)` | Accesor de solo lectura del valor almacenado / Read-only accessor for stored value |
| `TreeNode->new(value => $v)` | `value → TreeNode` | `O(1)` | Hereda de `Node`; enlaces `left` y `right` inicializados en `undef` / Inherits from `Node`; `left` and `right` links initialised to `undef` |
| `$node->left` | `TreeNode → TreeNode?` | `O(1)` | Accesor de lectura del hijo izquierdo (`undef` si ausente) / Read accessor for left child (`undef` if absent) |
| `$node->right` | `TreeNode → TreeNode?` | `O(1)` | Accesor de lectura del hijo derecho (`undef` si ausente) / Read accessor for right child (`undef` if absent) |
| `$node->set_left($child)` | `TreeNode? → void` | `O(1)` | Modifica el enlace izquierdo in-place (admite `undef`) / Mutates left link in-place (accepts `undef`) |
| `$node->set_right($child)` | `TreeNode? → void` | `O(1)` | Modifica el enlace derecho in-place (admite `undef`) / Mutates right link in-place (accepts `undef`) |
| `BinaryTree->new` | `→ BinaryTree` | `O(1)` | Inicializa ABB vacío con raíz `undef` y contador 0 / Initialises empty BST with `undef` root and count 0 |
| `$tree->is_empty` | `BinaryTree → bool` | `O(1)` | Verdadero si el contador es 0 / True if count is 0 |
| `$tree->size` | `BinaryTree → int` | `O(1)` | Número de nodos en el ABB / Number of nodes in the BST |
| `$tree->insert($v)` | `value → int` | `O(h)` | Inserción iterativa; duplicados no alteran tamaño; devuelve `1` / Iterative insertion; duplicates do not alter size; returns `1` |
| `$tree->contains($v)` | `value → int` | `O(h)` | Búsqueda iterativa siguiendo invariante ABB; `1` si está, `0` si falta / Iterative search following BST invariant; `1` if present, `0` if missing |
| `GraphNode->new(value => $label)` | `value → GraphNode` | `O(1)` | Nodo interno de grafo; hereda de `Node`; adyacencia `[]` y `next_vertex` en `undef` / Internal graph node; inherits from `Node`; adjacency `[]` and `next_vertex` `undef` |
| `Graph->new` | `→ Graph` | `O(1)` | Inicializa grafo vacío; lista de vértices `undef`, contadores 0 / Initialises empty graph; vertex list `undef`, counts 0 |
| `$graph->is_empty` | `Graph → bool` | `O(1)` | Verdadero si `vertex_count` es 0 / True if `vertex_count` is 0 |
| `$graph->vertex_count` | `Graph → int` | `O(1)` | Número de vértices registrados / Number of registered vertices |
| `$graph->edge_count` | `Graph → int` | `O(1)` | Número de aristas dirigidas / Number of directed edges |
| `$graph->add_vertex($label)` | `label → int` | `O(V)` | Inserta vértice al frente del registro enlazado si no existe; devuelve `1` / Prepends vertex to linked registry if absent; returns `1` |
| `$graph->add_edge($u, $v)` | `(label, label) → int` | `O(V + d(u))` | Localiza $u$ y $v$, inserta $v$ ordenado en adyacencia; `1` en éxito, `0` si falta extremo / Finds $u$ and $v$, inserts $v$ sorted into adjacency; `1` on success, `0` if endpoint missing |
| `$graph->has_edge($u, $v)` | `(label, label) → int` | `O(V + d(u))` | Comprueba si existe arista dirigida de $u$ a $v$; `1` si existe, `0` si no o si falta extremo / Checks directed edge from $u$ to $v$; `1` if present, `0` if missing or endpoint absent |
| `$graph->get_neighbors($u)` | `label → arrayref?` | `O(V + d(u))` | Copia independiente de etiquetas vecinas ordenadas; `undef` si no existe $u$ / Independent copy of sorted neighbour labels; `undef` if $u$ missing |

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Herencia nativa (`use parent`) sobre la base `Node` | Composición / valor embebido en cada nodo hijo | Perl soporta herencia simple de manera nativa mediante `@ISA` (`use parent`). Reutiliza limpiamente el almacenamiento de `value` cumpliendo la primera variante del contrato sin overhead / Perl natively supports single inheritance via `@ISA` (`use parent`). Cleanly reuses `value` storage satisfying the first contract variant without overhead |
| Orientación a objetos estándar con `bless` en lugar de Moo | Usar Moo (como en `data_structures_basics`) o Moose | Las estructuras avanzadas gestionan enlaces internos directos (`next_vertex`, referencias de nodos, manipulación manual con `splice`). El OO nativo elimina dependencias externas de ejecución y mantiene el código autocontenido / Advanced structures manage direct internal links (`next_vertex`, node refs, manual `splice`). Native OO eliminates external runtime dependencies and keeps code self-contained |
| Registro de vértices como lista enlazada canónica | Tabla hash asociativa (`$self->{vertices}{$label}`) para `O(1)` | La especificación prohíbe delegar el registro en diccionarios o tablas hash; exige recorrido manual explícito con enlaces canónicos `next_vertex` en `O(V)` / Specification strictly forbids delegating vertex registry to hash tables or dictionaries; requires explicit manual traversal with canonical `next_vertex` links in `O(V)` |
| Adyacencia con array nativo e inserción ordenada manual | Lista enlazada de adyacencia o `sort` al consultar | La especificación autoriza una secuencia nativa para almacenar vecinos siempre que la búsqueda, inserción ordenada y control de duplicados sean manuales en `O(d(u))`. `splice` sobre `[]` evita ordenar al consultar y cumple la cota / Specification permits native sequence for neighbours provided search, sorted insertion and deduplication are manual in `O(d(u))`. `splice` on `[]` avoids sorting on read and preserves complexity |
| Devolución de vecinos como referencia a array nueva | Devolver la referencia interna directa o lista aplanada | Proyectar las etiquetas mediante `map { $_->value }` crea una copia independiente que aísla el grafo: mutaciones externas no afectan la adyacencia y mutaciones posteriores del grafo no alteran resultados devueltos / Mapping labels via `map { $_->value }` yields an independent copy isolating the graph: external mutations do not affect adjacency and subsequent graph changes do not alter returned results |

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init(value)` / `init()` | `new(value => $v)` y `new()` | Convención idiomática de Perl para métodos constructores de clase / Idiomatic Perl convention for class constructor methods |
| `get_value()`, `get_left()`, `get_right()` | `$node->value`, `$node->left`, `$node->right` | Perl utiliza accesores de lectura estilo método sin prefijo `get_` / Perl uses method-style read accessors without `get_` prefix |
| Éxito y fallo booleanos (`success` / `failure`) | `1` para éxito y `0` para fallo | `1` y `0` son los indicadores booleanos escalares estándar de Perl para operaciones que devuelven verdad/falsedad / `1` and `0` are standard scalar boolean indicators in Perl for operations returning truth/falsity |
| Ausencia de enlace o elemento (`absent`) | `undef` | `undef` es el centinela nativo de Perl para valores no definidos o punteros nulos / `undef` is Perl's native sentinel for undefined values or null links |
| Layout `src/` y `test/run_tests.ext` | `lib/DataStructuresAdvanced/*.pm` y `test/data_structures_advanced_tests.pl` | Convención modular de Perl: jerarquía de paquetes bajo `lib/` y pruebas ejecutables directamente con `perl -Ilib` o `prove` / Perl modular convention: package hierarchy under `lib/` and tests runnable directly with `perl -Ilib` or `prove` |

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `TreeNode.left`, `TreeNode.right` | Enlace no asignado o desenlazado | `undef` | `$node->left` devuelve `undef` tras `new` / returns `undef` after `new` |
| `BinaryTree.contains` | Valor ausente en el árbol (incluso si está vacío) | `0` | `$tree->contains(99)` devuelve `0` / returns `0` |
| `Graph.add_edge` | Extremo `u` o `v` no registrado | `0` | `$graph->add_edge(10, 99)` devuelve `0` / returns `0` |
| `Graph.has_edge` | Arista ausente o extremo no registrado | `0` | `$graph->has_edge(10, 30)` devuelve `0` / returns `0` |
| `Graph.get_neighbors` | Vértice `u` no registrado | `undef` | `$graph->get_neighbors(99)` devuelve `undef` / returns `undef` |
| `BinaryTree.is_empty` | Árbol no vacío | `0` (falso) | Devuelve falsedad cuando `count > 0` / Returns false when `count > 0` |
| `Graph.is_empty` | Grafo no vacío | `0` (falso) | Devuelve falsedad cuando `vertex_count > 0` / Returns false when `vertex_count > 0` |

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| **TreeNode**: Crear un nodo de árbol | Sí | `test/data_structures_advanced_tests.pl:33-35` | `new(value => 10)` y `value == 10` / `new(value => 10)` and `value == 10` |
| **TreeNode**: Enlaces iniciales ausentes | Sí | `test/data_structures_advanced_tests.pl:36-37` | `left` y `right` devuelven `undef` / `left` and `right` return `undef` |
| **TreeNode**: Enlazar dos hijos | Sí | `test/data_structures_advanced_tests.pl:39-43` | `set_left(20)` y `set_right(30)`, valores observados / `set_left(20)` and `set_right(30)`, values verified |
| **TreeNode**: Recorrer cada enlace | Sí | `test/data_structures_advanced_tests.pl:45-53` | Seguir enlaces a hijos (20, 30) y verificar sus enlaces ausentes / Follow links to children (20, 30) and check absent child links |
| **TreeNode**: Desenlazar hijos | Sí | `test/data_structures_advanced_tests.pl:55-64` | `set_left(undef)` y `set_right(undef)` conservan valor 10 y limpian enlaces / Clearing left and right preserves value 10 and updates links |
| **TreeNode**: Adaptación inmutable (si aplica) | Omitido | `test/data_structures_advanced_tests.pl:28` | No aplica: `TreeNode` en Perl es mutable con mutación in-place vía `set_left` y `set_right` / Not applicable: `TreeNode` in Perl is mutable in-place via `set_left` and `set_right` |
| **BinaryTree**: Crear vacío | Sí | `test/data_structures_advanced_tests.pl:80-83` | `is_empty` verdadero, `size == 0`, `contains(50) == 0` / `is_empty` true, `size == 0`, `contains(50) == 0` |
| **BinaryTree**: Insertar la raíz | Sí | `test/data_structures_advanced_tests.pl:85-89` | `insert(50)` éxito, `size == 1`, `is_empty` falso, `contains(50) == 1` / `insert(50)` success, `size == 1`, `is_empty` false, `contains(50) == 1` |
| **BinaryTree**: Insertar menor y mayor | Sí | `test/data_structures_advanced_tests.pl:91` | Inserta 50, 30, 70; tamaño 3 y los 3 presentes / Inserts 50, 30, 70; size 3 and all 3 present |
| **BinaryTree**: Ramas de varios niveles | Sí | `test/data_structures_advanced_tests.pl:92` | Inserta 50, 30, 70, 20, 40; tamaño 5 y todos presentes / Inserts 50, 30, 70, 20, 40; size 5 and all present |
| **BinaryTree**: Valor ausente en árbol no vacío | Sí | `test/data_structures_advanced_tests.pl:94-98` | `contains(99) == 0`, tamaño 1 se mantiene, `contains(50) == 1` / `contains(99) == 0`, size 1 stays, `contains(50) == 1` |
| **BinaryTree**: Duplicado idempotente | Sí | `test/data_structures_advanced_tests.pl:100` | Inserta 50, 30, 70, 30; tamaño 3 y los 3 presentes / Inserts 50, 30, 70, 30; size 3 and all 3 present |
| **BinaryTree**: Inserciones ordenadas | Sí | `test/data_structures_advanced_tests.pl:101` | Inserta 20, 30, 40, 50, 70; tamaño 5, todos presentes y `contains(99) == 0` / Inserts 20, 30, 40, 50, 70; size 5, all present and `contains(99) == 0` |
| **Graph**: Crear vacío | Sí | `test/data_structures_advanced_tests.pl:116-122` | `is_empty` verdadero, 0 vértices, 0 aristas, `has_edge` falla, `get_neighbors` falla (`undef`) / `is_empty` true, 0 vertices, 0 edges, `has_edge` fails, `get_neighbors` fails (`undef`) |
| **Graph**: Vértice aislado | Sí | `test/data_structures_advanced_tests.pl:124-129` | `add_vertex(10)` éxito, no vacío, 1 vértice, 0 aristas, vecinos `[]` / `add_vertex(10)` success, not empty, 1 vertex, 0 edges, neighbours `[]` |
| **Graph**: Etiquetas no consecutivas y arista dirigida | Sí | `test/data_structures_advanced_tests.pl:131-138` | Vértices 10 y 70, arista `(10, 70)`, `has_edge(10, 70) == 1`, `has_edge(70, 10) == 0` / Vertices 10 and 70, edge `(10, 70)`, forward present, reverse absent |
| **Graph**: Vértice duplicado conserva adyacencia | Sí | `test/data_structures_advanced_tests.pl:140-145` | Re-insertar 10 conserva arista `(10, 30)`, 2 vértices, 1 arista, vecinos `[30]` / Re-inserting 10 preserves edge `(10, 30)`, 2 vertices, 1 edge, neighbours `[30]` |
| **Graph**: Arista duplicada | Sí | `test/data_structures_advanced_tests.pl:147-152` | Segunda `add_edge(10, 30)` tiene éxito, mantiene 2 vértices y 1 arista, vecinos `[30]` / Second `add_edge(10, 30)` succeeds, keeps 2 vertices and 1 edge, neighbours `[30]` |
| **Graph**: Extremo inexistente sin mutación | Sí | `test/data_structures_advanced_tests.pl:154-168` | Fallos en `(10, 99)`, `(99, 10)`, `(98, 99)`, `(99, 99)`; contadores y vecinos intactos / Failures on missing endpoints; counts and neighbours intact |
| **Graph**: Vecinos ordenados y contadores | Sí | `test/data_structures_advanced_tests.pl:170-178` | Vértices 10, 30, 50, 70; adyacencias desordenadas resultan en orden `[30, 50, 70]` / Out-of-order insertions yield sorted neighbours `[30, 50, 70]` |
| **Graph**: Consulta de arista ausente | Sí | `test/data_structures_advanced_tests.pl:180-184` | `has_edge(10, 30) == 0` con vértices registrados sin aristas; no vacío, 2 vértices, 0 aristas / `has_edge(10, 30) == 0` on registered vertices without edges; not empty, 2 vertices, 0 edges |
| **Graph**: Vecinos de vértice inexistente | Sí | `test/data_structures_advanced_tests.pl:186-190` | `get_neighbors(99)` devuelve `undef` (distinto de `[]` para vértice 10); 1 vértice, 0 aristas / `get_neighbors(99)` returns `undef` (distinct from `[]` for vertex 10); 1 vertex, 0 edges |
| **Graph**: Bucle y duplicado | Sí | `test/data_structures_advanced_tests.pl:192-198` | Bucle `(10, 10)` duplicado; 1 vértice, 1 arista; `has_edge(10, 10) == 1`, vecinos `[10]` / Duplicate loop `(10, 10)`; 1 vertex, 1 edge; `has_edge(10, 10) == 1`, neighbours `[10]` |
| **Graph**: Aislamiento del resultado de vecinos | Sí | `test/data_structures_advanced_tests.pl:200-210` | Modificar array devuelto (`push 99`) no afecta el grafo; alta posterior `(10, 50)` no altera resultado previo (`[30]`) / Modifying returned array does not mutate graph; subsequent edge insertion does not mutate prior query |

**ES:** Mapeo de casos: `unidad/variante → casos aplicables → grupo lógico → archivo/suite → runner`:
- `TreeNode` (variante mutable estándar) → 5 casos aplicables (1 omitido) → subtest `TreeNode` → `test/data_structures_advanced_tests.pl` → `perl -Ilib` / `prove`
- `BinaryTree` (ABB iterativo) → 7 casos aplicables → subtest `BinaryTree` → `test/data_structures_advanced_tests.pl` → `perl -Ilib` / `prove`
- `Graph` (registro enlazado y adyacencia ordenada) → 11 casos aplicables → subtest `Graph` → `test/data_structures_advanced_tests.pl` → `perl -Ilib` / `prove`

Total de escenarios de la especificación: 23 aplicables + 1 omitido.  
Total de aserciones de Test2: 135 aserciones (`TreeNode`: 17, `BinaryTree`: 48, `Graph`: 70).

**EN:** Case mapping: `unit/variant → applicable cases → logical group → file/suite → runner`:
- `TreeNode` (standard mutable variant) → 5 applicable cases (1 omitted) → subtest `TreeNode` → `test/data_structures_advanced_tests.pl` → `perl -Ilib` / `prove`
- `BinaryTree` (iterative BST) → 7 applicable cases → subtest `BinaryTree` → `test/data_structures_advanced_tests.pl` → `perl -Ilib` / `prove`
- `Graph` (linked registry and sorted adjacency) → 11 applicable cases → subtest `Graph` → `test/data_structures_advanced_tests.pl` → `perl -Ilib` / `prove`

Total specification scenarios: 23 applicable + 1 omitted.  
Total Test2 assertions: 135 assertions (`TreeNode`: 17, `BinaryTree`: 48, `Graph`: 70).

## ⚠️ Limitaciones conocidas / Known limitations

Ninguna / None

**ES:** El módulo implementa completamente el contrato de la especificación sin limitaciones impuestas por el lenguaje o la fase. Perl soporta mutabilidad nativa, referencias enlazadas y estructuras dinámicas sin límites artificiales de capacidad ni restricciones de memoria en esta escala.

**EN:** The module fully implements the specification contract without limitations imposed by the language or phase. Perl natively supports mutability, linked references and dynamic structures without artificial capacity bounds or memory restrictions at this scale.

## 📝 Notas de implementación / Implementation Notes

**ES:**
- **Modelo de objetos:** Utiliza tablas hash bendecidas (`bless`) y herencia estándar de Perl mediante `use parent 'DataStructuresAdvanced::Node'`. Los constructores `new` inicializan los atributos y llaman a `SUPER::new` para almacenar el valor en la clase base.
- **Árbol Binario de Búsqueda:** Tanto `insert` como `contains` se implementan de forma estrictamente iterativa con bucles `while`, respetando la invariante del ABB y garantizando complejidad temporal `O(h)` sin consumir la pila de llamadas de recursión de Perl.
- **Grafo Dirigido:**
  - El registro de vértices es una lista enlazada canónica mediante el puntero `next_vertex` en `GraphNode`, recorrida linealmente por `_find_vertex` en `O(V)`. No se utilizan tablas hash asociativas como registro de vértices.
  - La adyacencia se almacena en una secuencia nativa (`[]`) por vértice. La inserción ordenada y la verificación de duplicados se realizan manualmente mediante un recorrido lineal y `splice` en `O(d(u))`.
  - `get_neighbors` proyecta las etiquetas mediante `map { $_->value }` generando una nueva referencia a array aislada, cumpliendo el criterio de inmutabilidad externa y aislamiento de resultados.
- **Representación de ausencia e indicadores:** La ausencia de enlaces o nodos se representa con el valor nativo `undef`. Las operaciones de éxito/fallo (`insert`, `contains`, `add_vertex`, `add_edge`, `has_edge`) devuelven `1` y `0` como booleanos escalares estándar.

**EN:**
- **Object model:** Uses blessed hash references (`bless`) and standard Perl inheritance via `use parent 'DataStructuresAdvanced::Node'`. `new` constructors initialise attributes and call `SUPER::new` to store the value in the base class.
- **Binary Search Tree:** Both `insert` and `contains` are strictly iterative using `while` loops, adhering to the BST invariant and guaranteeing `O(h)` time complexity without consuming Perl's recursion call stack.
- **Directed Graph:**
  - Vertex registry is a canonical linked list via `next_vertex` in `GraphNode`, linearly traversed by `_find_vertex` in `O(V)`. Associative hash tables are not used as vertex registries.
  - Adjacency is stored in a native sequence (`[]`) per vertex. Sorted insertion and duplicate checking are manually performed via linear traversal and `splice` in `O(d(u))`.
  - `get_neighbors` maps labels via `map { $_->value }` producing a new isolated array reference, satisfying external immutability and result isolation requirements.
- **Absence representation & indicators:** Absence of links or nodes is represented by native `undef`. Success/failure operations (`insert`, `contains`, `add_vertex`, `add_edge`, `has_edge`) return `1` and `0` as standard scalar booleans.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](../../../../docs/core/algorithms/07_Data_Structures_Advanced.md) |
| Primera base del lenguaje / First language reference | `data_structures_basics` — [`data_structures_basics/`](../data_structures_basics/) |
| Segunda base del lenguaje / Second language reference | `numbers` — [`numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [https://perldoc.perl.org/](https://perldoc.perl.org/) |
| Programación orientada a objetos en Perl / Perl OO docs | [https://perldoc.perl.org/perlobj](https://perldoc.perl.org/perlobj) |

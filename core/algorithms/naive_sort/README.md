# Naive Sort — Perl

Implementación de la especificación [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) en **Perl (5.38+)**, con **Test2::Bundle::More** (distribución Test2-Suite) como framework de pruebas unitarias y el harness `prove`.

Tres algoritmos de ordenación con coste $O(n^2)$: **selection sort**, **bubble sort** e **insertion sort**, todos ordenando de forma ascendente el array recibido, sin bibliotecas de ordenamiento ni estructuras auxiliares.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`src/naive_sort.pl`](src/naive_sort.pl) | Módulo `naive_sort` — 3 funciones de ordenación. |
| [`test/naive_sort_tests.pl`](test/naive_sort_tests.pl) | Suite única: 3 tests (8 casos cada uno). |

**Estructura de directorios esperada:**

```text
naive_sort/
├── src/
│   └── naive_sort.pl          # selection_sort, bubble_sort, insertion_sort
└── test/
    └── naive_sort_tests.pl    # 3 tests, 8 casos cada uno
```

**ES:** No hay fichero de ejecución aparte: el runner es el propio harness `prove`, que descubre los `.pl` de `test/` con `--ext=.pl`.

**EN:** There is no separate launcher file: the runner is the `prove` harness itself, which discovers the `.pl` files in `test/` with `--ext=.pl`.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Sigue el mismo patrón que [`numbers`](../../foundations/numbers/) y [`calculator`](../../foundations/unit_test/calculator/): módulo `.pl` en `src/` con `use strict; use warnings;` y terminado en `1;` (lo exige `require`), y una suite en `test/` con Test2::Bundle::More. Las tres funciones se declaran con `sub` y son globales del paquete `main`, así que la suite las llama por su nombre tras el `require`.

**EN:** Follows the same pattern as [`numbers`](../../foundations/numbers/) and [`calculator`](../../foundations/unit_test/calculator/): a `.pl` module in `src/` with `use strict; use warnings;` ending in `1;` (required by `require`), and a suite in `test/` using Test2::Bundle::More. All three functions are declared with `sub` and are globals of the `main` package, so the suite calls them by name after the `require`.

**Combinación aplicada:** algoritmo iterativo (la especificación no usa recursión) → **1 suite × 3 tests = 3 tests (24 casos)**.

**Applied combination:** iterative algorithm (the specification uses no recursion) → **1 suite × 3 tests = 3 tests (24 cases)**.

### Inicialización / Initialization

**ES:** La estructura de este lenguaje es manual (✍️ `mkdir -p src test` en la guía de inicialización): no hay comando de andamiaje que ejecutar, y el módulo se compone a mano igual que `numbers/`.

**EN:** This language's structure is manual (✍️ `mkdir -p src test` in the initialization guide): there is no scaffolding command to run, and the module is assembled by hand just like `numbers/`.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `src/naive_sort.pl` — Implementación

**ES:** Las tres funciones reciben un **arrayref**, lo ordenan *in-place* y devuelven ese mismo arrayref. Si la entrada es `undef`, devuelven `undef` como indicador de fallo. Extracto de `selection_sort`:

**EN:** All three functions take an **arrayref**, sort it *in-place* and return that same arrayref. If the input is `undef`, they return `undef` as the failure indicator. Excerpt from `selection_sort`:

```perl
sub selection_sort {
    my ($arr) = @_;
    return undef unless defined $arr;

    my $n = scalar @$arr;
    return $arr if $n <= 1;

    for my $i (0 .. $n - 2) {
        my $min_index = $i;
        for my $j ($i + 1 .. $n - 1) {
            $min_index = $j if $arr->[$j] < $arr->[$min_index];
        }
        if ($min_index != $i) {
            my $temp = $arr->[$i];
            $arr->[$i] = $arr->[$min_index];
            $arr->[$min_index] = $temp;
        }
    }

    return $arr;
}
```

### Suites de pruebas — Test2::Bundle::More

**ES:** Una única suite con un `subtest` por función. Los 8 casos viven en una lista de hashes compartida y un único helper los recorre para cualquier función:

**EN:** A single suite with one `subtest` per function. The 8 cases live in a shared list of hashes and a single helper walks them for any function:

```perl
sub assert_sorts_all_cases {
    my ($sort, $algorithm) = @_;

    for my $case (@cases) {
        my $input  = $case->{input};
        my $actual = defined $input ? $sort->([@$input]) : $sort->(undef);

        is_deeply($actual, $case->{expected},
            "$algorithm should sort $case->{description}");
    }
}
```

**ES:** El helper recibe la función como **referencia** (`\&selection_sort`), lo que permite recorrer los casos una sola vez en lugar de repetir las aserciones tres veces.

**EN:** The helper receives the function as a **reference** (`\&selection_sort`), which lets it walk the cases once instead of repeating the assertions three times.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisitos / Requirements

- **Perl** (`perl`).
- **Test2-Suite** (`Test2::Bundle::More`).

```bash
perl --version

# Instalar Test2-Suite (una sola vez)
sudo cpan Test2::Suite

# Verificar instalación
perl -MTest2::Bundle::More -e1
```

### Verificación estática / Static check

**ES:** Perl compila y verifica el archivo con `-c` (`syntax OK`), que analiza sintaxis y comprobaciones básicas sin ejecutar el programa:

**EN:** Perl compiles and checks the file with `-c` (`syntax OK`), which analyses syntax and basic checks without running the program:

```bash
cd perl/core/algorithms/naive_sort
perl -c src/naive_sort.pl
perl -c test/naive_sort_tests.pl
```

### Ejecutar las pruebas unitarias / Run tests

```bash
cd perl/core/algorithms/naive_sort
perl test/naive_sort_tests.pl
```

### Alternativa con el harness `prove` / Alternative with the `prove` harness

```bash
cd perl/core/algorithms/naive_sort
prove --ext=.pl test/
```

### Salida esperada / Expected output

```text
ok 1 - Subtest: selection_sort
ok 2 - Subtest: bubble_sort
ok 3 - Subtest: insertion_sort
1..3
```

Con `prove`:

```text
test/naive_sort_tests.pl .. ok
All tests successful.
Files=1, Tests=3,  0 wallclock secs
Result: PASS
```

> **ES:** 3 tests en total (un subtest por algoritmo); los 24 casos viven como `is_deeply` dentro de ellos (8 por algoritmo), todos pasando.
> **EN:** 3 tests in total (one subtest per algorithm); the 24 cases live as `is_deeply` checks within them (8 per algorithm), all passing.

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Algoritmo | Función | Entrada ordenada | Entrada invertida |
|-----------|---------|:----------------:|:-----------------:|
| Selection sort | `selection_sort` | $O(n^2)$ | $O(n^2)$ |
| Bubble sort | `bubble_sort` | $O(n)$ (salida temprana) | $O(n^2)$ |
| Insertion sort | `insertion_sort` | $O(n)$ | $O(n^2)$ |

**ES:** Los tres algoritmos operan **in-place** sobre el arrayref recibido; no se crea ningún array auxiliar.

**EN:** All three algorithms operate **in-place** on the received arrayref; no auxiliary array is created.

### Casos cubiertos / Covered cases

| # | Entrada | Salida esperada |
|:-:|---------|-----------------|
| 1 | `[5, 2, 9, 1, 5, 6]` | `[1, 2, 5, 5, 6, 9]` |
| 2 | `[1, 2, 3, 4, 5]` | `[1, 2, 3, 4, 5]` |
| 3 | `[5, 4, 3, 2, 1]` | `[1, 2, 3, 4, 5]` |
| 4 | `[7, 7, 7, 7]` | `[7, 7, 7, 7]` |
| 5 | `[3, -1, 4, -5, 0]` | `[-5, -1, 0, 3, 4]` |
| 6 | `[42]` | `[42]` |
| 7 | `[]` | `[]` |
| 8 | `undef` | `undef` |

**ES:** Los 7 casos obligatorios de la especificación más el caso nulo, que aquí **sí es representable** porque Perl tiene `undef`.

**EN:** The 7 mandatory cases from the specification plus the null case, which **is representable here** because Perl has `undef`.

---

## 📝 Notas de implementación / Implementation Notes

### 🧬 Ordenamiento *in-place* sobre un arrayref / In-place sorting over an arrayref

**ES:** `sub` en Perl recibe siempre una **lista de argumentos**, así que la única forma de pasar un array como un único valor —y de que la función pueda mutar los datos del llamador— es pasar un **arrayref**. Las tres funciones reciben `$arr`, lo reordenan con `$arr->[$i] = …` y devuelven ese mismo arrayref, verificado con `$sort->($arr) == $arr`. Los tests aíslan cada caso ordenando una copia (`[@$input]`), de modo que un caso no contamine los siguientes.

**EN:** A Perl `sub` always receives a **list of arguments**, so the only way to pass an array as a single value —and for the function to mutate the caller's data— is to pass an **arrayref**. All three functions take `$arr`, reorder it with `$arr->[$i] = …` and return that same arrayref, verified with `$sort->($arr) == $arr`. The tests isolate each case by sorting a copy (`[@$input]`), so one case cannot contaminate the next.

### 🆗 Indicador de fallo con `undef` / Failure indicator via `undef`

**ES:** La especificación exige un indicador de fallo y prohíbe lanzar excepciones. En Perl el valor «ausencia de valor» es `undef`, así que `return undef unless defined $arr;` es la comprobación idiomática y no requiere mecanismos artificiales. El caso nulo se prueba de forma independiente del caso vacío: `defined $arr` es verdadero para `[]` y falso para `undef`.

**EN:** The specification requires a failure indicator and forbids throwing exceptions. In Perl the "no value" value is `undef`, so `return undef unless defined $arr;` is the idiomatic check and needs no artificial mechanism. The null case is tested independently from the empty case: `defined $arr` is true for `[]` and false for `undef`.

### 🚪 `last unless $swapped` como `break` / `last unless $swapped` as `break`

**ES:** `bubble_sort` mantiene la bandera `swapped` que exige la especificación: si una pasada completa no realiza ningún intercambio, el array ya está ordenado y el bucle se corta con `last unless $swapped;`, que es el `break` de Perl y equivale literalmente al `if not swapped then break` del pseudocódigo. Es lo que convierte el mejor caso en $O(n)$.

**EN:** `bubble_sort` keeps the `swapped` flag required by the specification: if a full pass performs no swap, the array is already sorted and the loop is cut with `last unless $swapped;`, which is Perl's `break` and matches the pseudocode's `if not swapped then break` literally. This is what makes the best case $O(n)$.

### ➿ Cotas de los bucles / Loop bounds

**ES:** Las cotas reproducen las del pseudocódigo: `for my $i (0 .. $n - 2)`, `for my $j ($i + 1 .. $n - 1)`, `for my $j (0 .. $n - 2 - $i)` y `for my $i (1 .. $n - 1)`. El operador de rango de Perl (`..`) es inclusivo en ambos extremos, y con la cota superior menor que la inferior devuelve una **lista vacía** (`0 .. -1`), de modo que no hacen falta guardas extra para arrays de 0 o 1 elementos.

**EN:** The bounds reproduce the pseudocode's: `for my $i (0 .. $n - 2)`, `for my $j ($i + 1 .. $n - 1)`, `for my $j (0 .. $n - 2 - $i)` and `for my $i (1 .. $n - 1)`. Perl's range operator (`..`) is inclusive at both ends, and when the upper bound is lower than the lower one it returns an **empty list** (`0 .. -1`), so no extra guards are needed for 0- or 1-element arrays.

### 🔀 Estabilidad de `insertion_sort` / `insertion_sort` stability

**ES:** El bucle interno se detiene con la comparación estricta `$arr->[$j] > $key`; los elementos iguales no se desplazan, por lo que `insertion_sort` es estable. El caso 1 (`[5, 2, 9, 1, 5, 6]`, con dos cincos) se beneficia de ello, aunque la comparación de los tests se hace sobre valores y no sobre identidad.

**EN:** The inner loop stops on the strict comparison `$arr->[$j] > $key`; equal elements do not shift, so `insertion_sort` is stable. Case 1 (`[5, 2, 9, 1, 5, 6]`, with two fives) benefits from it, although the tests compare values rather than identity.

### 🏷️ Naming y visibilidad / Naming and visibility

**ES:** Las funciones usan `snake_case` (`selection_sort`), que es a la vez la convención de Perl y el nombre que emplea la especificación, así que la API coincide con el contrato sin traducciones. Son `sub` del paquete `main` y la suite las alcanza por nombre después del `require`; no hay `main()`: el módulo termina en `1;` y el punto de entrada es el propio `prove`.

**EN:** Functions use `snake_case` (`selection_sort`), which is both Perl's convention and the name used by the specification, so the API matches the contract with no translation. They are `sub`s of the `main` package and the suite reaches them by name after the `require`; there is no `main()`: the module ends in `1;` and the entry point is `prove` itself.

### 🧪 Estructura de los tests / Test structure

**ES:** Una única suite con 3 `subtest`. Tres detalles importantes: (1) los casos se copian con `[@$input]` antes de pasarlos al algoritmo, porque los fixtures son compartidos y las funciones ordenan *in-place*; (2) la comparación usa `is_deeply`, porque `is` compararía las **direcciones** de los arrayrefs y no sus contenidos; (3) el mensaje del contrato (`"{algorithm} should sort an unsorted array"`) es el nombre de la aserción, de modo que el fallo aparece como `not ok 1 - selection_sort should sort an unsorted array`.

**EN:** A single suite with 3 `subtest`s. Three important details: (1) the cases are copied with `[@$input]` before being passed to the algorithm, because the fixtures are shared and the functions sort *in-place*; (2) the comparison uses `is_deeply`, because `is` would compare the arrayrefs' **addresses** rather than their contents; (3) the contract message (`"{algorithm} should sort an unsorted array"`) is the assertion's name, so the failure shows up as `not ok 1 - selection_sort should sort an unsorted array`.

```perl
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
```

### 📍 Desviaciones respecto a la ubicación esperada / Deviations from the expected location

| Especificación | Implementación | Motivo |
|----------------|----------------|--------|
| `src/naive_sort.ext` | `src/naive_sort.pl` | El nombre coincide exactamente; solo cambia la extensión. |
| `test/naive_sort_test.ext` | `test/naive_sort_tests.pl` | La convención de `numbers/` para las suites es el sufijo plural `_tests.pl` (`recursive_tests.pl`, `iterative_tests.pl`). |
| `test/run_tests.ext` | *(no existe)* | `prove` descubre y ejecuta las suites de `test/` con `--ext=.pl`. Ni `numbers/` ni `calculator/` incluyen un runner propio. |

**ES:** La API difiere de la forma literal del pseudocódigo en un punto: las funciones reciben y devuelven un **arrayref** en lugar del array. No es una elección estilística sino una imposición del lenguaje —un `sub` de Perl recibe siempre una lista de argumentos—, y es además la única forma de que el ordenamiento sea realmente *in-place* sobre los datos del llamador.

**EN:** The API differs from the pseudocode's literal form in one point: the functions take and return an **arrayref** instead of the array. This is not a stylistic choice but an imposition of the language —a Perl `sub` always receives a list of arguments— and it is also the only way for the sort to be genuinely *in-place* on the caller's data.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

*[← Volver a Algoritmos Puros](../README.md) · [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

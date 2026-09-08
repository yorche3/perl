# Numbers — Perl

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Perl**, usando **Test2::Bundle::More** (distribución **Test2-Suite** de CPAN) como framework de pruebas unitarias.

Tres enfoques de implementación para los mismos 5 algoritmos: **recursivo directo** (`_rec`), **recursivo con acumulador** (`_acc`) e **iterativo** (`_ite`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`src/numbers.pl`](src/numbers.pl) | Módulo con las 15 subrutinas (3 enfoques × 5 algoritmos) + 4 helpers `_help`. |
| [`test/recursive_tests.pl`](test/recursive_tests.pl) | Suite recursiva: 5 subtests (11 casos). |
| [`test/iterative_tests.pl`](test/iterative_tests.pl) | Suite iterativa: 5 subtests (11 casos). |

**Estructura de directorios esperada:**

```text
numbers/
├── src/
│   └── numbers.pl                # 15 subrutinas + 4 helpers _help
└── test/
    ├── recursive_tests.pl        # Tests recursivos (5 subtests, 11 casos)
    └── iterative_tests.pl        # Tests iterativos (5 subtests, 11 casos)
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Sigue el mismo patrón que [`calculator`](../unit_test/calculator/): módulo en `src/`, suites en `test/` y **Test2::Bundle::More** con `subtest` (un subtest por función, con sus casos dentro). Las 15 subrutinas se organizan en 3 grupos por enfoque:

| Enfoque | Sufijo | Ejemplo | ¿Tiene tests directos? |
| ------- | ------ | ------- | :---------------------: |
| Recursivo directo | `_rec` | `fibonacci_rec(n)` | ✅ Sí |
| Recursivo con acumulador | `_acc` | `fibonacci_acc(n)` | ❌ No (ver nota TCO) |
| Iterativo | `_ite` | `fibonacci_ite(n)` | ✅ Sí |

**EN:** Follows the same pattern as [`calculator`](../unit_test/calculator/): a module in `src/`, suites in `test/`, and **Test2::Bundle::More** with `subtest` (one subtest per function, with its cases inside). The 15 subroutines are organized into 3 groups by approach:

| Approach | Suffix | Example | Direct tests? |
| -------- | ------ | ------- | :-----------: |
| Direct recursion | `_rec` | `fibonacci_rec(n)` | ✅ Yes |
| Accumulator recursion | `_acc` | `fibonacci_acc(n)` | ❌ No (see TCO note) |
| Iterative | `_ite` | `fibonacci_ite(n)` | ✅ Yes |

**Combinación aplicada:** TCO ❌ + iteración ✅ → `_rec` + `_ite` = **2 suites × 5 tests = 10 tests (22 casos)**.

**Applied combination:** No TCO + iteration ✅ → `_rec` + `_ite` = **2 suites × 5 tests = 10 tests (22 cases)**.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build: el intérprete (`perl`) y el harness (`prove`) se invocan directamente desde línea de comandos.

### `src/numbers.pl` — Implementación

**ES:** Cada algoritmo tiene 3 implementaciones en un único archivo. Los helpers del enfoque con acumulador llevan el sufijo `_help` y son internos por convención (Perl no exporta nada si no hay un `package` que lo declare). Por ejemplo, `fibonacci`:

**EN:** Each algorithm has 3 implementations in a single file. The accumulator helpers carry the `_help` suffix and are internal by convention (Perl exports nothing unless a `package` declares it). For example, `fibonacci`:

```perl
# Enfoque recursivo directo / Direct recursion
sub fibonacci_rec {
    my ($n) = @_;
    return $n if $n <= 1;
    return fibonacci_rec($n - 1) + fibonacci_rec($n - 2);
}

# Enfoque con acumulador / Accumulator recursion
sub fibonacci_acc_help {
    my ($n, $acc2, $acc1) = @_;
    return $acc2 if $n <= 0;
    return $acc1 + $acc2 if $n <= 2;
    return fibonacci_acc_help($n - 1, $acc1, $acc1 + $acc2);
}

sub fibonacci_acc {
    my ($n) = @_;
    return fibonacci_acc_help($n, 0, 1);
}

# Enfoque iterativo / Iterative
sub fibonacci_ite {
    my ($n) = @_;
    return $n if $n <= 1;
    my $acc2 = 0;
    my $acc1 = 1;
    for (2 .. $n) {
        my $temp = $acc1 + $acc2;
        $acc2 = $acc1;
        $acc1 = $temp;
    }
    return $acc1;
}
```

| Algoritmo | `_rec` | `_acc` | `_ite` |
| --------- | ------ | ------ | ------ |
| `sum_of_first_n` | `n + sum_rec(n-1)` | helper con `acc + n` | bucle `1..n` |
| `factorial` | `n * fact_rec(n-1)` | helper con `acc * n` | bucle `2..n` |
| `fibonacci` | `fib_rec(n-1) + fib_rec(n-2)` | helper con `acc2, acc1` | bucle de intercambio |
| `greatest_common_divisor` | Euclides recursivo | helper (Euclides) | Euclides con `while ($b != 0)` |
| `least_common_multiple` | `int(a*b / gcd_rec)` | `int(a*b / gcd_acc)` | `int(a*b / gcd_ite)` |

### Suites de pruebas — Test2::Bundle::More

**ES:** Dos suites, una por enfoque probado. Cada suite agrupa un `subtest` por función (5 por suite); los 11 casos del pseudocódigo viven como `is` dentro de ellos (22 en total).

**EN:** Two suites, one per tested approach. Each suite groups one `subtest` per function (5 per suite); the specification pseudocode's 11 cases live as `is` checks within them (22 in total).

```perl
subtest 'fibonacci_rec' => sub {
    is(fibonacci_rec(0), 0, 'n=0');
    is(fibonacci_rec(1), 1, 'n=1');
    is(fibonacci_rec(6), 8, 'n=6');
};
```

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

### Ejecutar las pruebas unitarias / Run tests

```bash
cd perl/core/foundations/numbers
perl test/recursive_tests.pl
perl test/iterative_tests.pl
```

### Alternativa con el harness `prove` / Alternative with the `prove` harness

```bash
cd perl/core/foundations/numbers
prove --ext=.pl test/
```

### Salida esperada / Expected output

```text
ok 1 - Subtest: sum_of_first_n_rec
ok 2 - Subtest: factorial_rec
ok 3 - Subtest: fibonacci_rec
ok 4 - Subtest: greatest_common_divisor_rec
ok 5 - Subtest: least_common_multiple_rec
1..5
```

Con `prove`:

```text
test/iterative_tests.pl .. ok
test/recursive_tests.pl .. ok
All tests successful.
Files=2, Tests=10,  0 wallclock secs
Result: PASS
```

> **ES:** 10 tests en total (5 subtests por suite); los 22 casos viven como `is` dentro de ellos, todos pasando.
> **EN:** 10 tests in total (5 subtests per suite); the 22 cases live as `is` checks within them, all passing.

---

## 🔁 Sobre recursión con acumulador y Tail Call Optimization (TCO)

**ES:**
Tail recursion ocurre cuando la llamada recursiva es la última acción que ejecuta una función; después de la llamada no hay más instrucciones. La recursión con acumulador consigue esto pasando el estado previo como parámetro, sin dejar trabajo pendiente en la pila.

En Perl, **no se garantiza TCO**: el intérprete no optimiza las llamadas de cola, por lo que una recursión suficientemente profunda emite el warning `Deep recursion on subroutine` y puede desbordar la pila. La versión con acumulador se conserva únicamente con fines educativos, como puente conceptual entre la recursión directa (`_rec`) y la versión iterativa (`_ite`). Como no hay un beneficio práctico de rendimiento garantizado, **no se desarrollan pruebas unitarias específicas para las subrutinas `_acc`**. Su comportamiento queda validado a través de las suites recursiva e iterativa, que ejercitan los mismos resultados.

**EN:**
Tail recursion occurs when the recursive call is the last action executed by a function; after the call there are no more instructions. Accumulator recursion achieves this by passing the previous state as a parameter, leaving no pending work on the stack.

In Perl, **TCO is not guaranteed**: the interpreter does not optimize tail calls, so sufficiently deep recursion emits the `Deep recursion on subroutine` warning and may overflow the stack. The accumulator version is kept purely for educational purposes, as a conceptual bridge between direct recursion (`_rec`) and the iterative version (`_ite`). Since there is no guaranteed performance benefit, **no dedicated unit tests are written for the `_acc` subroutines**. Their behavior is validated through the recursive and iterative suites, which exercise the same results.

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** El proyecto no usa un `main`: el "punto de entrada" es el propio runner de `Test2::Bundle::More` (directamente o vía `prove`). Por eso no se necesita el `run_tests` del pseudocódigo (la especificación lo pide solo si el framework no lo incluye).
- **EN:** The project has no `main`: the "entry point" is Test2::Bundle::More's runner itself (directly or via `prove`). That's why the pseudocode's `run_tests` is not needed (the specification asks for it only if the framework doesn't include one).
- **ES:** Los helpers `_help` son internos por convención; el módulo usa únicamente la biblioteca estándar. `Test2::Bundle::More` es la única dependencia externa y es **solo para pruebas**.
- **EN:** The `_help` helpers are internal by convention; the module uses only the standard library. `Test2::Bundle::More` is the only external dependency and it is **test-only**.
- **ES:** En Perl `/` es división de punto flotante; por eso el MCM usa `int(a*b / gcd)` para devolver un entero exacto. El resto se calcula con `%` (válido para operandos positivos).
- **EN:** In Perl `/` is floating-point division; that's why LCM uses `int(a*b / gcd)` to return an exact integer. The remainder is computed with `%` (valid for positive operands).

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

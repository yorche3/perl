# Calculator — Perl

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Perl**, usando **Test2::Bundle::More** (distribución **Test2-Suite** de CPAN) como framework de pruebas unitarias.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`src/calculator.pl`](src/calculator.pl) | Módulo con las 5 operaciones aritméticas (subrutinas + `use strict`/`use warnings`). |
| [`test/calculator_test.pl`](test/calculator_test.pl) | 5 pruebas unitarias con `Test2::Bundle::More` (`is` + `done_testing`). |

**Estructura de directorios esperada:**

```text
calculator/
├── src/
│   └── calculator.pl            # 5 operaciones aritméticas
└── test/
    └── calculator_test.pl       # 5 tests con Test2::Bundle::More
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Test2::Bundle::More**, el bundle más recomendado de la arquitectura **Test2** (la evolución de Test::Builder/Test::More, con eventos enriquecidos, mejores diagnósticos y soporte para concurrencia). Se eligió porque es el framework de pruebas moderno de Perl y escala a las fases posteriores del proyecto; la regla de "solo stdlib" aplica a las bibliotecas de I/O de las fases 0-1, no al tooling de pruebas:

1. `calculator.pl` es un módulo con subrutinas simples; termina con `1;` (requisito de `require`).
2. Cada prueba verifica con `is(actual, expected, name)`; `done_testing` calcula el plan automáticamente.
3. `FindBin` resuelve la ruta al módulo con independencia del directorio de trabajo.
4. `multiplication`, `division` y `modulus` se implementan con las estrategias educativas de la especificación (sin usar los operadores `*`, `/` ni `%` respectivamente).

**EN:** This project uses **Test2::Bundle::More**, the most recommended bundle of the **Test2** architecture (the evolution of Test::Builder/Test::More, with enriched events, better diagnostics, and concurrency support). It was chosen because it is Perl's modern testing framework and scales to later project phases; the "stdlib only" rule applies to I/O libraries in phases 0-1, not to testing tooling:

1. `calculator.pl` is a module with plain subroutines; it ends with `1;` (a requirement of `require`).
2. Each test verifies with `is(actual, expected, name)`; `done_testing` computes the plan automatically.
3. `FindBin` resolves the module path regardless of the working directory.
4. `multiplication`, `division` and `modulus` are implemented with the educational strategies from the specification (without using the `*`, `/` or `%` operators respectively).

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build: el intérprete (`perl`) y el harness (`prove`) se invocan directamente desde línea de comandos.

### `src/calculator.pl` — Módulo principal

| Operación | Implementación educativa |
| --------- | ------------------------ |
| `addition(a, b)` | Suma directa (`a + b`). |
| `subtraction(a, b)` | Resta directa (`a - b`). |
| `multiplication(a, b)` | Suma repetitiva: acumula `a`, `b` veces (no usa `*`). |
| `division(a, b)` | Resta repetitiva: resta `b` de `a` mientras `a >= b` (no usa `/`). |
| `modulus(a, b)` | Construida sobre `division` y `multiplication` (no usa `%`). |

```perl
#!/usr/bin/perl
use strict;
use warnings;

sub addition {
    my ($a, $b) = @_;
    return $a + $b;
}

sub subtraction {
    my ($a, $b) = @_;
    return $a - $b;
}

sub multiplication {
    my ($a, $b) = @_;
    my $result = 0;
    for (1 .. $b) {
        $result = addition($result, $a);
    }
    return $result;
}

sub division {
    my ($a, $b) = @_;
    my $quotient = 0;
    while ($a >= $b) {
        $a = subtraction($a, $b);
        $quotient = addition($quotient, 1);
    }
    return $quotient;
}

sub modulus {
    my ($a, $b) = @_;
    my $q = division($a, $b);
    my $p = multiplication($q, $b);
    return subtraction($a, $p);
}

1;
```

### `test/calculator_test.pl` — Pruebas unitarias (Test2::Bundle::More)

**ES:** Una prueba por operación, con los mismos casos del pseudocódigo de la especificación.

**EN:** One test per operation, with the same cases as the specification pseudocode.

```perl
#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
require "$FindBin::Bin/../src/calculator.pl";

use Test2::Bundle::More;

is(addition(2, 3), 5, 'addition(2, 3) returns 5');
is(subtraction(5, 2), 3, 'subtraction(5, 2) returns 3');
is(multiplication(3, 4), 12, 'multiplication(3, 4) returns 12');
is(division(10, 3), 3, 'division(10, 3) returns 3');
is(modulus(10, 3), 1, 'modulus(10, 3) returns 1');

done_testing;
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Perl instalado

```bash
# Verificar instalación
perl --version
```

### Requisito: Test2-Suite (Test2::Bundle::More)

```bash
# System-wide (con sudo)
sudo cpan Test2::Suite

# Verificar instalación
perl -MTest2::Bundle::More -e1
```

### Ejecutar las pruebas unitarias / Run tests

```bash
cd perl/core/foundations/unit_test/calculator
perl test/calculator_test.pl
```

### Alternativa con el harness `prove` / Alternative with the `prove` harness

```bash
cd perl/core/foundations/unit_test/calculator
prove --ext=.pl test/
```

### Salida esperada / Expected output

```text
ok 1 - addition(2, 3) returns 5
ok 2 - subtraction(5, 2) returns 3
ok 3 - multiplication(3, 4) returns 12
ok 4 - division(10, 3) returns 3
ok 5 - modulus(10, 3) returns 1
1..5
```

Con `prove`:

```text
test/calculator_test.pl .. ok
All tests successful.
Files=1, Tests=5,  0 wallclock secs
Result: PASS
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** El proyecto no usa un `main`: el "punto de entrada" es el propio runner de `Test2::Bundle::More` (directamente o vía `prove`). Por eso no se necesita el `run_tests` del pseudocódigo (la especificación lo pide solo si el framework no lo incluye).
- **EN:** The project has no `main`: the "entry point" is Test2::Bundle::More's runner itself (directly or via `prove`). That's why the pseudocode's `run_tests` is not needed (the specification asks for it only if the framework doesn't include one).
- **ES:** `Test2::Bundle::More` es la única dependencia externa y es **solo para pruebas** (instalada desde CPAN); el módulo `calculator.pl` usa únicamente la biblioteca estándar. `FindBin` viene incluido con Perl.
- **EN:** `Test2::Bundle::More` is the only external dependency and it is **test-only** (installed from CPAN); the `calculator.pl` module uses only the standard library. `FindBin` ships with Perl.
- **ES:** `division` no valida `b == 0` (fuera del alcance de este ejemplo, como indica la especificación). `prove` solo recoge archivos con extensión `.t` por defecto, por eso se usa `--ext=.pl`.
- **EN:** `division` does not validate `b == 0` (out of scope for this example, as the specification states). `prove` only collects `.t` files by default, hence `--ext=.pl`.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

# 🚀 Fundamentos / Foundations — Perl

Implementación de los ejercicios de la sección [Fundamentos / Foundations](https://yorche3.github.io/programming_languages/core/foundations/) del repositorio principal en **Perl (5.38+)**.

---

## 📖 Descripción / Description

**ES:** Esta sección reúne los conceptos esenciales para empezar a trabajar con **Perl**. Cubre desde los programas más básicos (`Hello, World!` y `Hello, User!`) hasta la implementación de una calculadora con pruebas unitarias y algoritmos numéricos en tres enfoques progresivos (recursivo directo, recursivo con acumulador e iterativo).

**EN:** This section brings together the essential concepts to start working with **Perl**. It covers everything from the most basic programs (`Hello, World!` and `Hello, User!`) to the implementation of a calculator with unit tests and numerical algorithms in three progressive approaches (direct recursion, accumulator recursion, and iterative).

---

## 📁 Estructura / Structure

```text
perl/
└── core/
    └── foundations/
        ├── README.md              # Este archivo / This file
        ├── helloworld/            # 01_Hello_World — Primer programa
        │   ├── helloworld.pl
        │   └── README.md
        ├── hellouser/             # 02_Hello_User — Entrada y salida
        │   ├── hellouser.pl
        │   └── README.md
        ├── unit_test/
        │   └── calculator/        # 03_Unit_Test_Calculator — Pruebas unitarias
        │       ├── src/
        │       │   └── calculator.pl
        │       ├── test/
        │       │   └── calculator_test.pl
        │       └── README.md
        └── numbers/               # 04_Numbers — Algoritmos numéricos
            ├── src/
            │   └── numbers.pl
            ├── test/
            │   ├── recursive_tests.pl
            │   └── iterative_tests.pl
            └── README.md
```

---

## 🔢 Progresión / Progression

| Especificación | Proyecto | Conceptos | Tests | Dependencias externas |
| -------------- | -------- | --------- | :---: | :-------------------: |
| [`01_Hello_World`](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | [`helloworld/`](helloworld/) | Shebang, `print`, `\n` explícito | — | ❌ Solo stdlib |
| [`02_Hello_User`](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | [`hellouser/`](hellouser/) | `<STDIN>`, `chomp`, `my`, interpolación `$name` | — | ❌ Solo stdlib |
| [`03_Unit_Test_Calculator`](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | [`unit_test/calculator/`](unit_test/calculator/) | Test2::Bundle::More, `is`, `done_testing` | 5 | ✅ Test2-Suite (solo test) |
| [`04_Numbers`](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | [`numbers/`](numbers/) | Recursión, iteración, acumuladores, helpers, TCO | 10 | ✅ Test2-Suite (solo test) |

---

## 🛠️ Enfoque general / General Approach

**ES:** Los proyectos en esta sección siguen un patrón progresivo:

1. **Hello World** y **Hello User**: Programas de un solo archivo, ejecutados directamente con `perl`. Usan exclusivamente la biblioteca estándar.
2. **Calculator**: Primer proyecto con framework de pruebas externo (**Test2::Bundle::More**, el bundle recomendado de la arquitectura Test2). Introduce la separación `src/` + `test/` y el runner de Test2 (`perl test/...` o `prove`).
3. **Numbers**: Expande el patrón de Calculator a dos suites de prueba (una por enfoque probado). Perl **no garantiza TCO**, por lo que `_acc` se conserva como puente didáctico sin pruebas propias: `_rec` + `_ite` = 10 tests (22 casos).

**EN:** The projects in this section follow a progressive pattern:

1. **Hello World** and **Hello User**: Single-file programs, run directly with `perl`. Use only the standard library.
2. **Calculator**: First project with an external test framework (**Test2::Bundle::More**, the recommended bundle of the Test2 architecture). Introduces the `src/` + `test/` separation and Test2's runner (`perl test/...` or `prove`).
3. **Numbers**: Expands the Calculator pattern to two test suites (one per tested approach). Perl **does not guarantee TCO**, so `_acc` is kept as an educational bridge without dedicated tests: `_rec` + `_ite` = 10 tests (22 cases).

---

## 🚀 Ejecución rápida / Quick Start

### Hello World

```bash
cd perl/core/foundations/helloworld
perl helloworld.pl
```

### Hello User

```bash
cd perl/core/foundations/hellouser
perl hellouser.pl
```

### Calculator (pruebas)

```bash
cd perl/core/foundations/unit_test/calculator
prove --ext=.pl test/
```

### Numbers (pruebas)

```bash
cd perl/core/foundations/numbers
prove --ext=.pl test/
```

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

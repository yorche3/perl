# Algorithms Pure — Perl

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Perl**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase trabajan sobre **arrayrefs** (`[...]`), que en Perl **son mutables**, **se indexan desde 0** y admiten `undef` como indicador de fallo.

---

## 📂 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `prove --ext=.pl test/` + Test2 | 3 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
└── naive_sort/                  # 05_Naive_Sort
    ├── src/
    │   └── naive_sort.pl        # selection_sort, bubble_sort, insertion_sort
    ├── test/
    │   └── naive_sort_tests.pl  # 3 tests × 8 casos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Perl 5.38+ (intérprete, sin paso de compilación) |
| **CLI** | `prove --ext=.pl test/` |
| **Andamiaje** | Manual: ✍️ `mkdir -p src test`; no hay comando de inicialización |
| **Framework de tests** | Test2::Bundle::More (distribución Test2-Suite, CPAN) |
| **Runner** | El harness `prove`; no hay fichero de ejecución propio ni `main()` |
| **Separación** | `src/{modulo}.pl` (módulo) ↔ `test/` (suites `*_tests.pl`) |
| **Acceso al módulo** | `use FindBin; require "$FindBin::Bin/../src/{modulo}.pl";` al inicio de cada suite |
| **Verificación estática** | `perl -c <archivo>`, que reporta `syntax OK` |
| **Iteración** | Bucles `for`/`while` y `last` (el `break` de Perl) |
| **Indexación** | **0-based**, como el pseudocódigo |
| **API de arrays** | Los `sub` reciben siempre una lista, así que el array viaja como **arrayref** y se accede con `$arr->[$i]` |
| **Mutabilidad** | El arrayref se ordena *in-place* y se devuelve el mismo; los tests copian el fixture con `[@$input]` |
| **Naming** | `snake_case` para funciones (`selection_sort`), igual que la especificación; `sub` globales del paquete `main` |
| **Indicador de fallo** | `undef` — se devuelve tal cual, sin lanzar excepciones |
| **Comparación de arrayrefs** | `is_deeply`; `is` compararía direcciones, no contenidos |
| **Artefactos** | Ninguno: `prove` no genera ficheros; el módulo no necesita `.gitignore` |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
prove --ext=.pl test/
```

---

## ▶️ Siguiente / Next

👉 Continúa con los módulos pendientes de esta fase en el [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).
👉 Continue with the pending modules of this phase in the [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

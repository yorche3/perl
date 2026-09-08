# Perl

Proyectos en **Perl (5.38+)**, con programas simples ejecutados con el intérprete `perl` y proyectos con pruebas unitarias usando **Test2::Bundle::More** (Test2-Suite) y el harness `prove`.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
| ------ | ----------- |
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `unit_test/calculator`, `numbers` |

---

## ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld
perl helloworld.pl

# Hello, User!
cd core/foundations/hellouser
perl hellouser.pl

# Calculator Tests
cd core/foundations/unit_test/calculator
prove --ext=.pl test/

# Numbers Tests
cd core/foundations/numbers
prove --ext=.pl test/
```

---

## 📦 Requisitos / Requirements

| Herramienta | Instalación |
| ----------- | ----------- |
| [Perl 5.38+](https://www.perl.org/get.html) | `sudo apt install perl` (Linux) / incluido en macOS / [Descargar](https://www.perl.org/get.html) |
| [Test2-Suite](https://metacpan.org/dist/Test2-Suite) | `sudo cpan Test2::Suite` (solo para proyectos con tests) |

```bash
# Verificar instalación
perl --version
perl -MTest2::Bundle::More -e1   # sin errores = Test2 listo
```

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Programa simple (interpretado con `perl`)

**ES:** Un único archivo fuente, sin dependencias externas, ejecutado directamente con el intérprete. Ideal para `helloworld` y `hellouser`. Usa el shebang para poder ejecutarse como binario.

**EN:** A single source file, no external dependencies, run directly with the interpreter. Ideal for `helloworld` and `hellouser`. Uses the shebang to be executable as a binary.

```bash
perl <File>.pl                 # con el intérprete
chmod +x <File>.pl && ./<File>.pl   # directo (gracias al shebang)
perl -c <File>.pl              # verificar sintaxis sin ejecutar
```

### 2. Proyecto con pruebas unitarias (Test2::Bundle::More + prove)

**ES:** Para proyectos que requieren pruebas unitarias, se usa **Test2::Bundle::More** (el bundle más recomendado de la arquitectura Test2, desde CPAN) con `is`, `subtest` y `done_testing`. El código fuente se organiza en `src/` y las pruebas en `test/`, con `prove` como harness.

**EN:** For projects that require unit tests, **Test2::Bundle::More** (the most recommended bundle of the Test2 architecture, from CPAN) is used with `is`, `subtest` and `done_testing`. Source code goes in `src/` and tests in `test/`, with `prove` as the harness.

```bash
perl test/<suite>.pl           # ejecutar una suite directa
prove --ext=.pl test/          # harness (recoge todas las suites)
```

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
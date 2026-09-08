# Hello, World! — Perl

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **Perl**, con un enfoque manual y minimalista.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`helloworld.pl`](helloworld.pl) | Código fuente: imprime `"Hello, World! from Perl!"` en la salida estándar. |

**Estructura de directorios esperada:**

```text
helloworld/
├── helloworld.pl   # Código fuente
└── README.md       # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó manualmente, sin herramientas de scaffolding. Un único archivo `.pl` es suficiente: Perl es un lenguaje interpretado, por lo que no requiere compilación previa. La primera línea (`shebang`) permite ejecutarlo directamente como binario.

**EN:** The project was created manually, without scaffolding tools. A single `.pl` file is enough: Perl is an interpreted language, so no prior compilation is required. The first line (shebang) allows running it directly as a binary.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p perl/core/foundations/helloworld
   ```

2. Escribir el archivo `helloworld.pl` con el código fuente.

3. No se necesita ningún paso adicional de construcción o vinculación de dependencias.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build. El programa se ejecuta directamente con el intérprete `perl`.

```perl
#!/usr/bin/perl

print "Hello, World! from Perl!\n";
```

| Elemento | Propósito |
|----------|-----------|
| `#!/usr/bin/perl` | Shebang: indica al sistema el intérprete a usar al ejecutar el archivo directamente. |
| `print "..."` | Imprime la cadena en la salida estándar. |
| `\n` | Salto de línea explícito: `print` **no** lo añade automáticamente. |

> **ES:** A diferencia de otros lenguajes, `print` en Perl no agrega salto de línea; hay que incluirlo con `\n`. Desde Perl 5.10 existe también `say`, que sí lo añade (requiere `use feature 'say'` o `use v5.10`).
> **EN:** Unlike other languages, Perl's `print` does not append a newline; it must be included with `\n`. Since Perl 5.10 there is also `say`, which does append it (requires `use feature 'say'` or `use v5.10`).

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Perl instalado

```bash
# Verificar instalación
perl --version
```

### Ejecutar con el intérprete / Run with the interpreter

```bash
cd perl/core/foundations/helloworld
perl helloworld.pl
```

### Ejecutar directamente (gracias al shebang) / Run directly (thanks to the shebang)

```bash
cd perl/core/foundations/helloworld
chmod +x helloworld.pl
./helloworld.pl
```

### Verificar sintaxis sin ejecutar / Check syntax without running

```bash
perl -c helloworld.pl
```

### Salida esperada / Expected output

```text
Hello, World! from Perl!
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Perl no requiere una función `main`: el script se ejecuta de arriba a abajo.
- **EN:** Perl does not require a `main` function: the script executes top to bottom.
- **ES:** `print` no añade salto de línea automáticamente; el `\n` es parte de la cadena.
- **EN:** `print` does not append a newline automatically; the `\n` is part of the string.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

# Hello, User! — Perl

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Perl**, con un enfoque manual y minimalista.

Lee un nombre desde la entrada estándar y saluda al usuario.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hellouser.pl`](hellouser.pl) | Código fuente: solicita un nombre al usuario y saluda. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hellouser.pl    # Código fuente
└── README.md       # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este programa introduce cuatro conceptos nuevos respecto a `helloworld`:

1. **Escritura sin salto de línea** — `print` con una cadena sin `\n` deja el cursor junto al prompt.
2. **Entrada de usuario** — `<STDIN>` lee una línea desde la entrada estándar.
3. **Eliminación del salto de línea** — `chomp` quita el `\n` final de la línea leída.
4. **Variables léxicas e interpolación** — `my $name` declara una variable de ámbito léxico, y `"Hello, $name!"` interpola su valor.

**EN:** This program introduces four new concepts compared to `helloworld`:

1. **Writing without newline** — `print` with a string lacking `\n` leaves the cursor next to the prompt.
2. **User input** — `<STDIN>` reads a line from standard input.
3. **Newline removal** — `chomp` strips the trailing `\n` from the read line.
4. **Lexical variables and interpolation** — `my $name` declares a lexically scoped variable, and `"Hello, $name!"` interpolates its value.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p perl/core/foundations/hellouser
   ```

2. Escribir el archivo `hellouser.pl` con el código fuente.

3. No se necesita ningún paso adicional de construcción o vinculación de dependencias.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build. El programa se ejecuta directamente con el intérprete `perl`.

**ES:** El flujo del programa es:

1. Imprimir `"Enter your name: "` con `print` (sin `\n`).
2. Leer una línea desde `stdin` con `<STDIN>`.
3. Eliminar el salto de línea final con `chomp`.
4. Imprimir `"Hello, <nombre>!"` interpolando la variable.
5. Terminar con `exit`.

**EN:** Program flow:

1. Print `"Enter your name: "` with `print` (no `\n`).
2. Read a line from `stdin` with `<STDIN>`.
3. Strip the trailing newline with `chomp`.
4. Print `"Hello, <name>!"` interpolating the variable.
5. Terminate with `exit`.

```perl
#!/usr/bin/perl

print "Enter your name: ";
my $name = <STDIN>;
chomp $name;
print "Hello, $name!\n";

exit;
```

| Elemento | Propósito |
|----------|-----------|
| `print "Enter your name: "` | Imprime el prompt **sin** salto de línea al final (el cursor permanece junto al prompt). |
| `<STDIN>` | Lee una línea completa desde la entrada estándar (incluye el `\n` final). |
| `chomp $name` | Elimina el `\n` final de la línea leída. |
| `my $name` | Variable de ámbito léxico; el sigilo `$` marca una variable escalar (una cadena, aquí). |
| `"Hello, $name!"` | Interpolación: `$name` se sustituye por su valor dentro de las comillas dobles. |
| `exit` | Termina el programa explícitamente. |

> **ES:** La interpolación solo ocurre con comillas dobles (`"..."`); con comillas simples (`'...'`) la cadena se usa literal. `<STDIN>` devuelve `undef` al llegar al final de la entrada.
> **EN:** Interpolation only happens with double quotes (`"..."`); with single quotes (`'...'`) the string is used literally. `<STDIN>` returns `undef` when it reaches the end of input.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Perl instalado

```bash
# Verificar instalación
perl --version
```

### Ejecutar con el intérprete / Run with the interpreter

```bash
cd perl/core/foundations/hellouser
perl hellouser.pl
```

### Ejecutar directamente (gracias al shebang) / Run directly (thanks to the shebang)

```bash
cd perl/core/foundations/hellouser
chmod +x hellouser.pl
./hellouser.pl
```

### Verificar sintaxis sin ejecutar / Check syntax without running

```bash
perl -c hellouser.pl
```

### Salida esperada / Expected output

```text
Enter your name: Ada
Hello, Ada!
```

> **ES:** El programa espera a que el usuario escriba su nombre y presione Enter antes de mostrar el saludo.

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Perl no requiere una función `main`: el script se ejecuta de arriba a abajo.
- **EN:** Perl does not require a `main` function: the script executes top to bottom.
- **ES:** `chomp` es esencial: sin él, el saludo se imprimiría con un salto de línea extra entre el nombre y `!`.
- **EN:** `chomp` is essential: without it, the greeting would print an extra newline between the name and `!`.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

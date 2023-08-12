## Getting Started with NASM Assembly on macOS

### 1. Install NASM

If NASM is not already installed (it usually comes with Xcode), you can install it using Homebrew:

```shell
brew install nasm
```

### 2. Assemble Your ASM File

Assemble your `hello_world.asm` file with NASM using the following command:

```shell
nasm -f macho64 hello_world.asm -o hello_world.o
```

### 3. Link Object File

Link the object file with `ld` to make it executable. This command might seem verbose, but it's one possible way to do it:

```shell
ld hello_world.o -o hello_world -macosx_version_min 10.14 -no_pie -syslibroot $(xcrun --show-sdk-path) -lSystem
```

Here's a breakdown of the flags used:

- `ld` links the object file with libraries to create an executable.
- `hello_world.o` is the object file to link.
- `-o hello_world` names the output executable.
- `-macosx_version_min 10.14` targets macOS 10.14+, as the `-no_pie` option is deprecated in the latest versions.
- `-no_pie` generates a 'non-position independent executable' since NASM uses absolute addresses (non-PIE).
- `-syslibroot $(xcrun --show-sdk-path)` points to the macOS SDK.
- `-lSystem` links libSystem.dylib from the SDK.

### 4. Execute the Program

To execute the program, run:

```shell
./hello_world
```

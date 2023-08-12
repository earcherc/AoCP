1. If not already installed (installed with xcode usually), install NASM
`brew install nasm`

2. Assemble file with NASM
`nasm -f macho64 hello_world.asm -o hello_world.o`

3. Link object file with `ld` (so it can be executable) (this seems verbose and is just one possible command)
`ld hello_world.o -o hello_world -macosx_version_min 10.14 -no_pie -syslibroot $(xcrun --show-sdk-path) -lSystem`

`ld` - links object file with libraries to create an executable.
`hello_world.o` - the object file to link.
`-o hello_world` - names the output exec.
`-macosx_version_min 10.14` - targets macOS 10.14+ due to -no_pie being deprecated in latest versions.
`-no_pie` generates a 'non-position independent executable' - as NASM uses absolute addresses (non-pie).
`-syslibroot $(xcrun --show-sdk-path)` - points to the MacOS SDK.
`-lSystem` - links libSystem.dylib from the SDK.

4. To execute the program
`./hello_world`

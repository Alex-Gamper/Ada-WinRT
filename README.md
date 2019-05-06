## Ada-WinRT

This project provides a set of Ada bindings (aka language projection) to the Microsoft Windows WinRT API
and is targeted at two distinct use cases

- Windows **Store** applications
- Windows native **Desktop** applications

These bindings have been generated from the metadata describing the WinRT api provided in the
Microsoft Windows 10 SDK *19H1 (build 10.0.18362)*

### Project Status

v 1.0 Released

### Prerequisites

You will need a working gcc/gnat **x64** Windows build environment. This release has **NOT** yet been
tested against 32 bit environments. You may need to build gcc/gnat **x64** from source if required.
Details/scripts on how to do this can be found on the mingw64 website, alternatively install using MSYS2

### Project Dependencies

**Winrt** is dependent upon **Winrt_Runtime** project. Please clone and build/install this project before attempting
to use this project.

### Configuration Instructions

The Winrt.gpr needs to know where to install the project files/artifacts, this is specified by the
variable named Base_Installation_Dir within the gpr file. You will need to change this value to suit your
environment.

For example

* MSYS2 (gcc version 8.3) - Base_Installation_Dir := "lib\gcc\x86_64-w64-mingw32\8.3.1/";
* MSYS2 (gcc version 9.1) - Base_Installation_Dir := "lib\gcc\x86_64-w64-mingw32\9.1.1/";
* AdaCore CE 2018 (gcc version 7.3) - Base_Installation_Dir := "lib\gcc\x86_64-pc-mingw32\7.3.1/";
* AdaCore CE 2019 (gcc version ?.?) - Base_Installation_Dir := "lib\gcc\x86_64-pc-mingw32\?.?.?/";

### Build instructions

From a command prompt that has your gcc/gnat x64 distribution/build environments bin directory in its path,
simply run the following commands.

* .\gprbuild -p -P Winrt.gpr
* .\gprinstall -f -p -P Winrt.gpr

Alternatively, their is a build.cmd script as part of the distribution that runs the above two commands.

### Notes

If you have previously built this runtime for a different target/version. Then please clean your previous env
by executing the following command

* .\gprclean -P Winnrt.gpr

### Examples

Please see the appropriate readme within the appropiate directory. The following samples are provided

* Desktop Examples

  * Ocr - demonstrates how to use the Optical Character Recognition API (via the Storage/Streams/Bitmap API's) Also demonstrates a possible approach to handling **async** functions/procedures from within Ada (aka C#'s async/await) The other alternative approach is to use delegates/callbacks, which is demonstrated in the **Network** example.
  
  * Network - demonstrates the use of the tcp/ip Steam socket to connect to a server

* Store Examples

  tba

### Feedback

Welcome

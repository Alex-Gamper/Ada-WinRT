## Ada-WinRT

This project provides a set of Ada bindings (aka language projection) to the Microsoft Windows WinRT API
and is targeted at two distinct use cases

- Windows **Store** applications
- Windows native **Desktop** applications

These bindings have been generated from the metadata describing the WinRT api provided in the
Microsoft Windows 10 SDK *1809 (build 10.0.17763)*

### Prerequisites

You will need a working gcc/gnat **x64** Windows build environment. This release has **NOT** yet been
tested against 32 bit environments. You may need to build gcc/gnat **x64** from source if required.
Details/scripts on how to do this can be found on the mingw64 website, alternatively install using MSYS2

#### Alternatively you can use the Linux shell scripts in Ada-Mingw64 repository to build a native toolchain on Linux

### Build instructions

From a command prompt that has your gcc/gnat x64 distribution/build environments bin directory in its path,
simply run the following command. This will do a gprbuild & gprinstall of the WinRT.gpr

* .\Build.cmd

### Examples

Please see the appropriate readme within the appropiate directory. The following samples are provided

* Desktop Examples

  * Ocr - demonstrates how to use the Optical Character Recognition API (via the Storage/Streams/Bitmap API's) Also demonstrates a possible approach to handling **async** functions/procedures from within Ada (aka C#'s async/await) The other alternative approach is to use delegates/callbacks, which is demonstrated in the **Network** example.
  
  * Network - demonstrates the use of the tcp/ip Steam socket to connect to a server

* Store Examples

  tba

### Feedback

Welcome

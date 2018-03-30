### Build instructions

* Initial build (from a command prompt that has your gcc/gnat x64 distribution/build environments **bin** directory in its path)
  
  * gprbuild -p -P Ocr.gpr
  * .\x64\debug\Ocr.exe
  
If you have Visual Studio 2017 (any edition) installed you can debug the application via the IDE,
provided you have the following features installed

* **Linux development with C++** Workload

  * Optional sub feature - **Visual C++ tools for CMake and Linux**
  * Optional sub feature - **Embedded and IoT Development**

* Subsequent builds using Visual Studio 2017 IDE

  * Start Visual Studio 2017
  * File->Open->Folder and select the Ocr directory (you should see the x64\debug\Ocr.exe in *Solution Explorer*)
  * Select Ocr.exe from the **Select Startup Item** drop down (next to the green arrow on the toolbar)
  * *Right click* the makefile, and you should see **Build,** **Rebuild** and **Clean** commands on the context menu
  * Microsoft NMAKE will then invoke the appropriate makefile target
    (If you have *GNU Make* installed on your path, you could change the *tasks.vs.json* configuration file)

* Subsequent debuging using Visual Studio 2017 IDE
  
  **Note:** Your gcc/gnat x64 distribution/build environment must include GDB

  * Start Visual Studio 2017
  * File->Open->Folder and select the Ocr directory (you should see the x64\debug\Ocr.exe in *Solution Explorer*)
  * Select Ocr.exe from the **Select Startup Item** drop down (next to the green arrow on the toolbar)
  * Set a breakpoint in the appropriate Ada source file and then press either F5, F10 or F11, Note that F11 will step into the Ada initialization code within b_Ocr.adb (specificaly the main function, which does the call to the elaboration code, before entering Ocr's main procedure)

  **Note:** The integration with Visual Studio was tailored from the following Microsoft document
  https://docs.microsoft.com/en-us/visualstudio/ide/develop-code-in-visual-studio-without-projects-or-solutions

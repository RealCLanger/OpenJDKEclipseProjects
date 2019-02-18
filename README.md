# OpenJDKEclipseProjects

A set of Eclipse Java Projects for OpenJDK development.

# How are the projects organized

The projects link to some folder where the JDK sources are located (e.g. cloned mercurial or git repository). Eclipse's build output is stored in the output folder of the workspace.

Some JDK modules contain operating system specific implementation parts. For these modules, different projects per OS platform exist and are located in correspondent subdirectories. One example for OS specific implementation parts is the "java.base" module. So you'll need to add the projects suiting to the operating system platform that you are developping for. If you are developping for different OS platforms, you'll need multiple workspaces (one for each OS). You can develop on a different OS platform than the one you are targeting for. E.g. you can develop on a Mac for the Linux JDK.

As certain Java source files are generated during a JDK build, you'll also need a build directory of an OpenJDK or at least the support/gensrc folder of it. If you don't have these build artifacts or they don't match to the JDK repo, you'll see errors in the IDE.

# How to use

First, make sure you have Eclipse in the latest version. The most convenient way to install Eclipse is the Eclipse installer: https://www.eclipse.org/downloads/packages/installer. You should select the Eclipse IDE for Java Developers. You should install the latest released version.  

Then, check out this repository's branch that fits to the JDK version that you want to develop. The "master" branch works for the head version of OpenJDK (e.g. the "jdk" repo) and jdk12. There's also a branch for JDK 11 development, named "jdk11". Repositories for older OpenJDK versions are not supported.  

In Eclipse, use linked resources and set up some variables:  
OPENJDK_SRC -> Path of the directory of your JDK sources. For a reference where to find the JDK sources, see section "JDK repositories".  
JDK_BUILD_DIR -> Path of the build directory of your JDK build. This could also be a folder where just the support/gensrc folder of a build directory resides.  
JTREG_PATH -> Path of the jtreg tool used to run OpenJDK jtreg tests. This is only needed, if you plan importing the jtreg test projects.  

Now import the required projects via Import -> Existing Projects into Workspace. Import the projects from the following root directories:  
a) import the projects of the specific os subdirectory, either aix, linux, macosx, solaris, windows  
b) if you are developping on a non-windows platform (aix/linux/macosx/solaris), import the projects from the subdirectory "unix"  
c) import the projects from the subdirectory "common"  
d) if you need aot/graal features, import subdirectory "aotgraal"  
e) if you want to work on jtreg tests, import subdirectory "jtreg"  

# Current status

After the projects were imported, you'll find a few IDE errors because the Eclipse Java compiler does not agree with the JDK's javac in all points. The observable problems seem to relate to Eclipse bug https://bugs.eclipse.org/bugs/show_bug.cgi?id=530236 which refer to OpenJDK's bug https://bugs.openjdk.java.net/browse/JDK-8016207 and friends.

Sometimes, you'll see that java.desktop shows a strange error about a missing class. This can be resolved by cleaning/rebuilding the jdk.datatransfer project.

If you find further issues, please report them either here or directly at the Eclipse bug system.

# JDK repositories

OpenJDK:  
Master repository (currently JDK 13 dev): http://hg.openjdk.java.net/jdk/jdk/  
JDK 12 release version: http://hg.openjdk.java.net/jdk/jdk12/  
JDK 12 updates repository: http://hg.openjdk.java.net/jdk-updates/jdk12u/  
JDK 11 updates repository: http://hg.openjdk.java.net/jdk-updates/jdk11u/  

SapMachine:  
SapMachine (currently JDK 13 dev): https://github.com/SAP/SapMachine/tree/sapmachine  
SapMachine 12: https://github.com/SAP/SapMachine/tree/sapmachine12  
SapMachine 11: https://github.com/SAP/SapMachine/tree/sapmachine11  

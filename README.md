# OpenJDKEclipseProjects

A set of Eclipse Java Projects for OpenJDK development.

# How are the projects organized

The projects access the JDK sources via a "Linked Resource" in Eclipse. Eclipse's build output is stored in the output folder of the workspace.

Some JDK modules contain operating system specific implementation parts, for instance the java.base module. For these modules, different projects per OS platform exist and are located in correspondent subdirectories. So you'll need to add the projects suiting to the operating system platform that you are developping for. If you are developping for different OS platforms, you'll need multiple workspaces (one for each OS). You can develop on a different OS platform than the one you are targeting for. E.g. you can develop on a Mac for the Linux JDK.

As certain Java source files are generated during a JDK build, you'll also need a build directory of a JDK or at least the support/gensrc folder of it. If you don't have these build artifacts or they don't match to the JDK repository you're working on, you'll see errors in the IDE.

# How to use

First, make sure you have Eclipse in the latest version. The most convenient way to install Eclipse is the Eclipse installer: https://www.eclipse.org/downloads/packages/installer. You should select the Eclipse IDE for Java Developers. You should install the latest released version.  

Then, check out this repository's branch that fits to the JDK version that you want to develop. The "master" branch works for the head version of OpenJDK (e.g. the "jdk" repo). There's also a branch for JDK 11 development, named "jdk11" and JDK 8 development "jdk8". Repositories for older JDK versions are not supported.  

In Eclipse, use linked resources and set up some variables:  
JDK_SRC -> Path of the directory of your JDK sources. For a reference where to find the JDK sources, see section "JDK repositories".  
JDK_BUILD_DIR -> Path of the build directory of your JDK build. This could also be a folder where just the support/gensrc folder of a build directory resides.  
JTREG_PATH -> Path of the jtreg tool used to run OpenJDK jtreg tests. This is only needed, if you plan importing the jtreg test projects.  

Now import the required projects via Import -> Existing Projects into Workspace. Import the projects from the following root directories:  
a) import the projects of the specific os subdirectory, either aix, linux, macosx, solaris, windows  
b) if you are developping on a non-windows platform (aix/linux/macosx/solaris), import the projects from the subdirectory "unix"  
c) import the projects from the subdirectory "common"  
d) if you need aot/graal features, import subdirectory "aotgraal"  
e) if you want to work on jtreg tests, import projects from subdirectory "test"  

# Current status

For master jdk, you should see a few compile errors in the test project jdk-com.sun.jdi.

If you find further issues, please report them either here or directly at the Eclipse bug system.

# JDK repositories

OpenJDK:  
Master repository (currently JDK 14 dev): http://hg.openjdk.java.net/jdk/jdk/  
JDK 13 updates repository: http://hg.openjdk.java.net/jdk-updates/jdk13u/  
JDK 11 updates repository: http://hg.openjdk.java.net/jdk-updates/jdk11u/  

SapMachine:  
SapMachine (currently JDK 14 dev): https://github.com/SAP/SapMachine/tree/sapmachine  
SapMachine 13: https://github.com/SAP/SapMachine/tree/sapmachine13  
SapMachine 11: https://github.com/SAP/SapMachine/tree/sapmachine11  

# OpenJDKEclipseProjects
A set of Eclipse Java Projects for OpenJDK development.

# How to use

The projects link to some folder where the JDK sources are located. The build output is stored in the output folder of the workspace.

First, check out this repository's branch that fits to the JDK version that you develop. "master" works for the head version of OpenJDK (jdk repo) and jdk12. There's also a branch for JDK 11 development, named "jdk11". Older JDK version repos are not supported.

In Eclipse, use linked resources and set up 2 variables:
OPENJDK_SRC -> pointing to the file system directory of your JDK sources. For a reference where to find the JDK sources, see section "JDK repositories"
JDK_BUILD_DIR -> pointing to the build directory for JDK builds (the support/gensrc folder of the build dir is needed because some Java source files are generated during an JDK build). If you don't have these build artefacts or they don't match to the JDK repo, you'll get build errors.

As JDK Java sources contain some platform specific Java classes and/or implementations, you need to add the projects suiting to the Operating System platform that you are developping for. If you are developping for different OS platforms, you'll need multiple workspaces (one for each OS).

Now import the required projects via Import -> Existing Projects into Workspace. Import the projects from the following root directories: 
a) import the projects of the specific os subdirectory, either aix, linux, macosx, solaris, windows
b) if you are developping on a non-windows platform (aix/linux/macosx/solaris), import the projects from the subdirectory "unix"
c) import the projects from the subdirectory "common"
d) if you need aot/graal features, import subdirectory "aotgraal"

# Current status

There is a bug which causes the projects not to build (build throws exception very early in java.base). This was fixed with Eclipse bug
https://bugs.eclipse.org/bugs/show_bug.cgi?id=475996. Unfortunately, the fix has neither made it into release 2018-09 nor in the Java 11 support patch (https://marketplace.eclipse.org/content/java-11-support-eclipse-photon-49). It's fixed in master and will be included in 2018-12.

After this bugfix, there are some issues which seem to relate to bug https://bugs.eclipse.org/bugs/show_bug.cgi?id=530236 which is about a JLS specification issue and probable misbehavior of JDK's javac (https://bugs.openjdk.java.net/browse/JDK-8016207).

There are further issues which may or may not occur, still under investigation.

# JDK repositories

Master repository (JDK 12 dev):
http://hg.openjdk.java.net/jdk/jdk/

JDK11:
JDK 11 release version: http://hg.openjdk.java.net/jdk/jdk11/
JDK 11 updates repository: http://hg.openjdk.java.net/jdk-updates/jdk11u/

JDK10:
JDK 10 release version: http://hg.openjdk.java.net/jdk/jdk10/
JDK 10 updates repository: http://hg.openjdk.java.net/jdk-updates/jdk10u/

SapMachine (JDK 12 dev): https://github.com/SAP/SapMachine/tree/sapmachine
SapMachine 11: https://github.com/SAP/SapMachine/tree/sapmachine11
SapMachine 10: https://github.com/SAP/SapMachine/tree/sapmachine10

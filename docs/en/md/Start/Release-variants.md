---
sidebar_position: 1
---

# About releases variants

The Open Integration Package is a project with three development paths: 1C, OneScript, and CLI. The main version is 1C, which is then automatically transformed into a package for OneScript, and from there into a CLI application. Each of these paths has its own distribution options – there are 8 in total: 3 for 1C, 4 for CLI, and 1 for OneScript. Descriptions of each of these are provided below

>To the latest release: [Click!](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest)

## 1С:Enterprise
These release options are various forms of distribution for the extension for the 1C:Enterprise platform

<img style={{paddingRight:'20px',marginTop:'6px'}} src={require('./img/1.png').default} width="86" align="left"/>
**OpenIntegrations_x.x.x_lang.cfe** - the standard distribution option for the 1C configuration extension. To start working, it is sufficient to load it into the list of extensions for your specific configuration. Development is carried out in compatibility mode with 1C 8.3.10.

<img style={{paddingRight:'20px',marginTop:'6px'}} src={require('./img/2.png').default} width="86" align="left"/>
**XML.zip** - this is a zip archive that contains the files of the standard 1C extension export "to files". Similar to the CFE option, the unpacked archive can be used to load the extension through the Configuration Extensions panel in a specific project

<img style={{paddingRight:'20px',marginTop:'6px'}} src={require('./img/3.png').default} width="86" align="left"/>
**EDT.zip** - this is a zip archive that contains the files of the EDT extension project. This distribution option is intended for quickly starting work with the Open Integration Package in cases where the development of the main configuration is carried out using 1C Enterprise Development Tools

<br/>

## CLI
these release options are various forms of distribution for OInt CLI – a cross-platform terminal/command line application that implements the full functionality of the OpenIntegrations library without being tied to the 1C/OS technology stack

<img style={{paddingRight:'20px',marginTop:'20px'}} src={require('./img/6.png').default} width="86" align="left"/>
**oint_x.x.x_installer_lang.exe** - this is a Windows installer. It is the recommended installation method for Windows OS, as it automatically creates the program directory and sets the PATH (after restarting the computer). This allows the application to be launched from any location by simply typing oint in the command line

<img style={{paddingRight:'20px',marginTop:'6px'}} src={require('./img/7.png').default} width="86" align="left"/>
**oint_x.x.x_all_lang.deb** - this is a DEB package designed for installing OInt in Debian/Ubuntu and other deb-based distributions. The package has no inbuilt dependencies, so no additional downloads from the internet are required to get it working

<img style={{paddingRight:'20px',marginTop:'16px'}} src={require('./img/8.png').default} width="86" align="left"/>
**oint-x.x.x-1.noarch_lang.rpm** - this is an RPM package designed to install OInt in RHEL/Fedora/CentOS and other rpm-based distributions. It automatically suggests the install libicu - the internalisation package for Unicode (ICU) required for the application engine to work

<img style={{paddingRight:'20px',marginTop:'16px'}} src={require('./img/9.png').default} width="86" align="left"/>
**oint-x.x.x_lang-x86_64.AppImage** is an AppImage format file that allows you to use OInt CLI as a single executable file without additional installation. The downloaded file must be made executable via `chmod +x ./oint-x.x.x_lang-x86_64.AppImage`, after which it can be launched in the terminal

<img style={{paddingRight:'20px',marginTop:'20px'}} src={require('./img/5.png').default} width="86" align="left"/>
**`Deprecated since v. 1.18.0`** **oint.exe** - an executable file that, despite its Windows-oriented extension, is cross-platform. It requires .Net Framework 4.8 or a compatible version of Mono to run. In Windows and Debian-based distributions, this application is launched simply through the command line/terminal, while in RHEL-based distributions, it is launched through ```mono oint.exe "$@"```

:::warning
The single file delivery is currently *`obsolete`* and is not recommended for use. It has performance issues and depends on the .Net Framework, so it only makes sense for evaluation use in cases where installing from the package/installer is undesirable or impossible for some reason
:::

<br/>


## OneScript
These release options are intended for use in OneScript projects

<img style={{paddingRight:'20px',marginTop:'16px'}} src={require('./img/4.png').default} width="86" align="left"/>
**oint-x.x.x.ospx** - this is an OSPX package intended for installation via the OPM package manager. You can use it for offline installation using the command
``` opm install -f "./OInt-x.x.x.ospx" ```.
But it is much easier to install OInt directly from the package hub. You don't need to download any files for this, just execute the command ``` opm install oint ```



<br/>

---
sidebar_position: 5
---

# Building from Source

When a new version of the Open Integration Package is released, you can obtain pre-built distribution variants for different platforms and operating systems from the [release description on GitHub](https://github.com/Bayselonarrend/OpenIntegrations/releases) or the [Download section on this website](/download). However, besides using ready-made files, you can also build any distribution variant using the project's source code distributed on the GitHub platform. This section describes the steps for building each of these variants.

## Branches

The project repository has two main branches - `main` and `stable`. The `main` branch contains the main, current development of the project. This means it may contain both current fixes and improvements, as well as various unfinished changes or features in development. The `stable` branch, in turn, always contains the current codebase of the latest published release and is updated only with the release of the next stable version of the package.

Depending on the tasks at hand, you can use code from one of these branches during the build process:

```bash
  git clone -b main https://github.com/Bayselonarrend/OpenIntegrations
  git clone -b stable https://github.com/Bayselonarrend/OpenIntegrations
```

## Building the 1C Version

The codebase for the 1C:Enterprise extension is stored in the repository as an EDT project. You can use it directly in 1C:EDT, or export it from EDT to XML format for the Configurator after connection.

You can connect the project in 1C:EDT using the command `File -> Import -> Projects from Git`. During setup, you will be prompted to select a local repository or clone a remote one, as well as specify the path to a specific project within it.

<img src={require('../../static/img/Docs/Start/en/1.png').default} />

The repository stores two versions of the project: in Russian and English. You can distinguish and select the required one by the directory location - `ru` or `en`.

After connecting the project, you can export it to native XML format for the Configurator using the command `File -> Export -> Configuration to XML Files`.

## Building OneScript and CLI Versions

The version for [OneScript](https://oscript.io), as well as the console application based on it, are OSPX packages for installation via the OPM package manager. Their source code is stored in the `/src/<language>/OInt` and `/src/<language>/cli` directories respectively, and can be built by calling the following command from the selected directory:

```bash
  opm build
```

As a result of executing this command, an `.ospx` file will be created, which can be installed into the local OneScript package directory using the command:

```bash
  opm install -f <path to ospx file>
```

Building the Windows installer, Linux packages, and other derived distribution variants is done using a comprehensive build script that is also located within the repository. You can review it at the path [`/ci/os/releasemaker.os`](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/ci/os/releasemaker.os). By themselves, these distribution variants represent the same `ospx` packages, but delivered together with the OneScript engine in one package.
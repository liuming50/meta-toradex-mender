# meta-toradex
OpenEmbedded/Yocto BSP Toradex Mender layer


# Dependencies

```
URI: git://git.openembedded.org/openembedded-core.git
branch: thud
revision: HEAD

URI: git://git.openembedded.org/bitbake.git
branch: 1.46
revision: HEAD

URI: git://git.openembedded.org/meta-openembedded.git
branch: thud
revision: HEAD

URI: git://github.com/Freescale/meta-freescale.git
branch: thud
revision: HEAD

URI: git://github.com/Freescale/meta-freescale-3rdparty.git
branch: thud
revision: HEAD

URI: git://github.com/Freescale/meta-freescale-distro.git
branch: thud
revision: HEAD

URI: https://git.toradex.com/meta-toradex-bsp-common.git
branch: thud
revision: HEAD

URI: https://git.toradex.com/meta-toradex-distro.git
branch: thud
revision: HEAD

URI: https://git.toradex.com/meta-toradex-nxp.git
branch: thud
revision: HEAD

URI: https://git.toradex.com/meta-toradex-tegra.git
branch: thud
revision: HEAD

URI: git://github.com/meta-qt5/meta-qt5.git
branch: thud
revision: HEAD

URI: git://github.com/mendersoftware/meta-mender.git
branch: thud
revision: HEAD

git://github.com/mendersoftware/meta-mender-community.git
branch: thud
revision: HEAD

URI: git://git.yoctoproject.org/meta-security.git
branch: thud
revision: HEAD

URI: git://github.com/OSSystems/meta-browser.git
branch: master
revision: HEAD

```


# Getting started

meta-toradex-mender consist of multiple Git repositories and repo is the tool that makes it easier to work with those repositories as a whole. Create a local bin/ directory, download the repo tool to that directory, and allow the binary executable with the following commands:

```
$ make -p ~/bin
$ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
$ export PATH=~/bin:$PATH
```


# Download the source

Create an empty directory that will hold the meta-toradex-mender and Yocto source files and serve as the working directory. Enter the following commands to bring down the latest version of repo tool, including its most recent fixes. The URL specifies the manifest that refers various repositories used by meta-toradex-mender, which are placed within the working directory. For now, a .repo folder is created to store the manifest and the metadata of the source repositories.

To be noticed: In the following two steps, you might be asked for github username and password, then you need input them.

```
$ mkdir ~/toradex-mender-workspace
$ cd ~/toradex-mender-workspace
$ repo init -u https://github.com/liuming50/toradex-mender-manifests.git -b master
```

Enter the following command to pull down the source tree to your working directory. The repo sync operation might take time depending on your Internet download speed.

```
$ repo sync
```


# Build the source natively (Verified only on Ubuntu 16.04/18.04)

Set up the environment:

```
$ cd ~/toradex-mender-workspace
$ TEMPLATE=(qemu|toradex) . poky-init-build-env
$ bitbake console-tdx-image
```


# Install image by Toradex Easy Installer (colibri-imx6ull)

Download Toradex Easy Installer from:
https://docs.toradex.com/104719-colibri-imx6ull-toradexeasyinstaller.zip

Find the installer tarball from build:
~/toradex-mender-workspace/build-toradex/deploy/images/colibri-imx6ull/Colibri-iMX6ULL_Console-Image-Tezi_3.0b5-${DATE}.tar

For how to use Toradex Easy Installer, please refer to:
https://developer.toradex.com/software/toradex-easy-installer


# Run image in qemu (To be continued)

```
$ cd ~/toradex-mender-workspace
$ TEMPLATE=qemu . poky-init-build-env
$ bitbake console-tdx-image
$ runqemu qemuarm64
```


Then open another console and access the machine by a vnc client, for instance:

```
$ xtightvncviewer 127.0.0.1
```


# Start mender server on local host (Verified only on Ubuntu 16.04/18.04)

Refer to: https://docs.mender.io/2.5/server-installation/demo-installation


Layer Maintainer: [Ming Liu](<mailto:liu.ming50@gmail.com>)

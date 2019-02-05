# archlinux-pkgs
My personal build scripts for archlinux, everything here is pretty experimental but might be useful some people. At creation these packages were either non existent in the archlinux user repository or didn't compile correctly. Not all packages are confirmed to work on a clean build system, known issues will appear in this file. For a clean-build package proceed similar to the steps below:

## Known issues:
### foam-extend-git
* The built process is currently ignoring all cuda based libraries of foam-extend (found in the `src/foam-extend-git/src/cudaSolvers` directory)
* Currently ignoring all addons in the `src/foam-extend-git/extend-bazaar` directory
#### mesquite
* The provided package `mesquite-2.3.0` wrongly includes the directory `src/foam-extend-git/ThirdParty/packages/mesquite-2.3.0/platforms/linux64GccDPOpt/lib` relative to the location where the package was built in the run-time search path for the executables `msqquality`, `msqshape`, `vtkrandom` and `vtkxform`. The patch applied from https://github.com/trilinos/mesquite/pull/4 needs to be further modified to address this.
* a package called `mesquite` already exists in the AUR (currently in version 3.40-1). This is NOT related with the package provided. This one is part of the trilinos packages (though not included in the release 12-12-1 somehow).

## Clean build example for foam-extend-git
change into the directory of the `foam-exted-git`-package:
`cd archlinux-pkgs/foam-extend-git`
As the build process is going to take a considerable ammount of time, allocate some space on the system-memory to improve performance (make sure you have enough):
```bash
sudo mount -o remount,size=8G,noatime /tmp
sudo mkdir /tmp/chroot
export CHROOT=/tmp/chroot
```
Create a clean arch installation satisfying only the minimal build requirenments in the `chroot`-directory:
```bash
sudo mkarchroot -C /etc/pacman.conf -M /etc/makepkg.conf $CHROOT/root base base-devel sudo python-numpy tcsh git cmake mercurial python-setuptools
```
Similarly - packages not available in the official repositories can be provided to the clean installation before the building process:
```bash
sudo cp /PATH_TO_PRECOMPILED_PACKAGE/rpm-org-4.14.2.1-1-x86_64.pkg.tar /tmp/chroot/root/rpm-org-4.14.2.1-1-x86_64.pkg.tar
sudo arch-nspawn $CHROOT/root pacman -U /rpm-org-4.14.2.1-1-x86_64.pkg.tar
```
Or directly be passed on with the makechrootpkg command using one or more `-I` (install) flags:
```bash
makechrootpkg -c -r $CHROOT -I mgridgen-1.0-1-x86_64.pkg.tar -I parmetis-4.0.3.p4-1-x86_64.pkg.tar -I rpm-org-4.14.2.1-1-x86_64.pkg.tar -I scotch-6.0.6-1-x86_64.pkg.tar
```

# archlinux-pkgs
My personal build scripts for archlinux, everything here is pretty experimental but might be useful some people. At creation these packages were either non existent in the archlinux user repository or didn't compile correctly. Not all packages are confirmed to work on a clean build system, known issues will appear in this file. For a clean-build package proceed similar to the steps below:

## Clean build example for foam-extend-git
change into the directory of the `foam-exted-git`-package:
`cd archlinux-pkgs/foam-extend-git`
As the build process is going to take a considerable ammount of time, allocate some space on the system-memory to improve performance (make sure you have enough):
```bash
sudo mount -o remount,size=12G,noatime /tmp
sudo mkdir /tmp/chroot
export CHROOT_SHELL=/tmp/chroot
```
Create a clean arch installation in the `chroot`-directory with the required packages:
```bash
sudo mkarchroot -C /etc/pacman.conf -M /etc/makepkg.conf $CHROOT_SHELL/root base base-devel sudo yajl qt4 openmpi python2-virtualenv python2-numpy git cmake wget gcc5 mercurial
```
Packages not available in the official repositories can be provided to the clean installation if they have been prebuilt:
```bash
sudo cp ~/Downloads/rpm-org-4.13.0.1-1-x86_64.pkg.tar.xz /tmp/chroot/root/rpm-org-4.13.0.1-1-x86_64.pkg.tar.xz
sudo arch-nspawn $CHROOT_SHELL/root pacman -U /rpm-org-4.13.0.1-1-x86_64.pkg.tar.xz
```
Finally start the build-process.
```bash
makechrootpkg -c -r $CHROOT_SHELL &> log.makechrootpkg &
```

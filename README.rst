=============
flatpak-xchat
=============

|Travis| |License|

.. |Travis| image:: https://img.shields.io/travis/karras/flatpak-xchat.svg?style=flat-square
   :target: https://travis-ci.org/karras/flatpak-xchat
.. |License| image:: https://img.shields.io/github/license/karras/flatpak-xchat.svg?style=flat-square
   :target: LICENSE

This repository contains a set of patches and a manifest to create a Flatpak
build of XChat 2.8.8, a rather outdated IRC client.

XChat will have the following permissions:

* Access X11 and DBUS
* Access the network
* Access to the directory XDG_DOWNLOAD

The configuration is stored in ``~/.var/app/io.github.Xchat/.xchat2``.

Usage
=====
Follow the steps described below to build XChat from scratch. All steps are
executed within the user context:

1. Install ``flatpak`` with your package manager
2. Clone this repository and switch into the created directory
3. Download the required runtimes: ::

   $ flatpak install --user flathub org.gnome.Platform//3.28
   $ flatpak install --user flathub org.gnome.Sdk//3.28

4. Build and install the app in a local repository: ::

   $ flatpak-builder --user --install io.github.Xchat.json

5. Run the app: ::

   $ flatpak run io.github.Xchat/x86_64/stable

Patches
=======
Most patches were taken from the Arch Linux build of XChat and reused without
any modifications. The package has been deprecated and replaced by Hexchat in
the meantime.

License
=======
GNU GENERAL PUBLIC LICENSE Version 3

See the `LICENSE`_ file.

.. _LICENSE: LICENSE

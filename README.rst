=============
flatpak-xchat
=============

|Travis| |License|

.. |Travis| image:: https://img.shields.io/travis/karras/flatpak-xchat.svg?style=flat-square
   :target: https://travis-ci.org/karras/flatpak-xchat
.. |License| image:: https://img.shields.io/github/license/karras/flatpak-xchat.svg?style=flat-square
   :target: LICENSE

This repository contains a set of patches and a manifest to create a Flatpak
build of XChat 2.8, a rather outdated IRC client.

XChat will have the following permissions:

* Access X11 and DBUS
* Access the network
* Access to the directory XDG_DOWNLOAD

Usage
=====
Follow the steps described below to build XChat from scratch. All steps are
executed within the user context:

1. Install ``flatpak`` with your package manager
2. Clone this repository and switch into the created directory
3. Download the Gnome SDK key: ::

   $ wget https://sdk.gnome.org/keys/gnome-sdk.gpg

4. Add the Gnome Flatpak Repositories: ::

   $ flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/ --user
   $ flatpak remote-add --gpg-import=gnome-sdk.gpg gnome-apps https://sdk.gnome.org/repo-apps/ --user

5. Install the Gnome runtimes: ::

   $ flatpak install gnome org.gnome.Platform 3.20 --user
   $ flatpak install gnome org.gnome.Sdk 3.20 --user

6. Check the installed runtimes: ::

   $ flatpak list --runtime --show-details --user

7. Build XChat: ::

   $ flatpak-builder build xchat-manifest.json

8. Export the app, add it to a remote and install it: ::

   $ flatpak build-export repo build
   $ flatpak remote-add --no-gpg-verify xchat-repo repo --user
   $ flatpak install xchat-repo ch.karras.Xchat --user

9. Create the .xchat2 config directory if it does not exist and run the app: ::

   $ mkdir ~/.xchat2
   $ flatpak run ch.karras.Xchat

Patches
=======
The patches were taken from the Arch Linux build of XChat and reused without
any modifications. The package has been deprecated and replaced by Hexchat in
the meantime.

License
=======
GNU GENERAL PUBLIC LICENSE Version 3

See the `LICENSE`_ file.

.. _LICENSE: LICENSE

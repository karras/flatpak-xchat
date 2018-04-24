# Container to test Flatpak builds
FROM fedora:27

MAINTAINER karras "https://github.com/karras"

# Install Flatpak and dependencies
RUN dnf install flatpak flatpak-builder wget git bzip2 elfutils -y && \
    dnf clean all

# Install runtimes, merged into one layer because of xattr attributes
RUN wget -P /tmp https://sdk.gnome.org/keys/gnome-sdk.gpg && \
    flatpak remote-add --gpg-import=/tmp/gnome-sdk.gpg gnome https://sdk.gnome.org/repo/ && \
    flatpak install gnome org.gnome.Platform 3.28 && \
    flatpak install gnome org.gnome.Sdk 3.28

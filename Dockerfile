# Container to test Flatpak XChat builds
FROM fedora:24

MAINTAINER karras "https://github.com/karras"

RUN dnf install flatpak flatpak-builder wget git bzip2 elfutils -y && \
    dnf clean all

RUN wget -P /tmp https://sdk.gnome.org/keys/gnome-sdk.gpg && \
    flatpak remote-add --gpg-import=/tmp/gnome-sdk.gpg gnome https://sdk.gnome.org/repo/ && \
    flatpak install gnome org.gnome.Platform 3.20 && \
    flatpak install gnome org.gnome.Sdk 3.20

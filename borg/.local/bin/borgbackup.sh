#!/usr/bin/env bash

# Main launcher for Borgmatic backups, which executes backups to both BorgBase online repository
# and to NAS. It is started from a systemd user unit.
#
# Prerequisites:
# 1) all files correctly stowed (this script, Borgmatic config files, systemd user units)
# 2) file $HOME/.borg-passphrase must exist and contain password to repositories
# 3) systemd timer needs to be enabled and started with 'systemctl --user enable --now borgbackup.timer'
#
# Backup can be executed also manually by running 'systemctl --user start borgbackup.service'
# or for individual repositories by running one of the borgmatic commands from this script.

if [[ -r "$HOME/.borg-passphrase" ]]; then
    cp /etc/fstab $HOME/.config/

    notify-send --icon="dialog-information" "Borgmatic" "Starting Borgmatic backups"

    borgmatic --config $HOME/.config/borgmatic/config.yaml

    if mountpoint -q /media/NAS/Media || mount /media/NAS/Media; then
        borgmatic --config $HOME/.config/borgmatic/NAS.yaml
    else
        notify-send --icon="dialog-warning" --urgency=critical "Borgmatic" "NAS not reachable, skipping NAS backup"
    fi
fi


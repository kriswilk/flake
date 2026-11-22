# shellcheck shell=bash
# body of the "install" package (see install.nix), which supplies the shebang, strict mode and HOSTS

# run everything as root (the sudo environment is reset, so the re-run sets up its own)
[[ ${EUID} -eq 0 ]] || exec sudo "$0"

export NIX_CONFIG="experimental-features = nix-command flakes"

REPO="https://github.com/kriswilk/flake"
SRC="$(mktemp -d)"
KEY_DEST="/mnt/var/lib/age/keys.txt"

function notify() {
    printf '\n\e[1;7m %s \e[0m\n\n' "$1"
}

function die() {
    echo "$1"
    exit 1
}

################################################################################

notify "CLONE"

git clone "${REPO}" "${SRC}"

################################################################################

notify "HOST"

# offer hosts that are defined in the flake
HOST="$(printf '%s\n' "${HOSTS[@]}" | fzf --prompt='host> ')"

################################################################################

notify "DISK"

# offer only non-removable disks
DISK_LINE="$(lsblk -dpo NAME,SIZE,MODEL,TRAN --filter 'TYPE=="disk" && RM==0' |
    fzf --prompt='disk> ' --header-lines=1)"
DISK="${DISK_LINE%% *}"
[[ -n "${DISK}" ]] || die "No disk selected"
export DISKO_DEVICE="${DISK}"

################################################################################

notify "DISKO"

# final confirmation before anything destructive
read -r -p "Wipe ${DISK} and install '${HOST}'? Type 'yes': " CONFIRM
[[ "${CONFIRM}" == "yes" ]] || die "Aborted"

disko --mode destroy,format,mount --yes-wipe-all-disks --flake "${SRC}#${HOST}"

################################################################################

notify "KEY FILE"

# look for the encrypted key file (keys.txt.age) on mounted filesystems
mapfile -t KEY_FILES < <(
    findmnt -lno TARGET --real | while read -r MNT; do
        [[ ! -f "${MNT}/keys.txt.age" ]] || echo "${MNT}/keys.txt.age"
    done
)
[[ ${#KEY_FILES[@]} -gt 0 ]] || die "No keys.txt.age found on any mounted filesystem"
KEY_FILE="$(printf '%s\n' "${KEY_FILES[@]}" | fzf --prompt='key> ' --select-1 || true)"
[[ -n "${KEY_FILE}" ]] || die "No key file selected"
read -r -p "Use '${KEY_FILE}'? [y/N] " USE_KEY
[[ "${USE_KEY}" == [yY] ]] || die "Aborted"

# decrypt the key file to the target system
until age -d "${KEY_FILE}" | install -D -m 600 /dev/stdin "${KEY_DEST}"; do
    echo "Decryption failed, try again"
done

################################################################################

notify "INSTALL"

nixos-install --max-jobs 2 --cores 2 --no-channel-copy --no-root-password --flake "${SRC}#${HOST}"

################################################################################

notify "COPY REPO"

# copy the flake to the target system and set its ownership to group "wheel"
cp -aT "${SRC}" /mnt/etc/nixos
nixos-enter --root /mnt -c '
    chgrp -R wheel /etc/nixos
    chmod -R g+rwX /etc/nixos
    find /etc/nixos -type d -exec chmod g+s {} +
'

################################################################################

notify "CLEAN UP"

umount -R /mnt

################################################################################

notify "REBOOT"

read -r -p "Reboot now? [y/N] " REBOOT
if [[ "${REBOOT}" == [yY] ]]; then
    reboot
fi

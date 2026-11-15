
#!/usr/bin/env bash

set -Eeuo pipefail

# ==========================================
#             KRNL-DOTS INSTALLER
#          Arch Linux / Hyprland
# ==========================================

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PACKAGES=(
    cava
    fastfetch
    fuzzel
    hypr
    kitty
    waybar
)

WALLPAPER_DIR="$HOME/Pictures/KRNL"

mkdir -p "$WALLPAPER_DIR"

if [ -d "$DOTFILES_DIR/wallpaper" ]; then
    cp -r "$DOTFILES_DIR/wallpaper/." "$WALLPAPER_DIR/"
    echo "[KRNL] Wallpapers installed successfully!"
else
    echo "[KRNL] Wallpaper directory not found!"
fi


DEPENDENCIES=(
    cava
    fastfetch
    fuzzel
    hyprland
    kitty
    waybar
    swaybg
    stow
    hyprshot
)

BACKUP_DIR="$HOME/.config/krnl-backup-$(date +%Y%m%d-%H%M%S)"
BACKUP_CREATED=0

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

info() {
    echo -e "${CYAN}[KRNL]${RESET} $1"
}

success() {
    echo -e "${GREEN}[OK]${RESET} $1"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

# ==========================================
# CHECK SYSTEM
# ==========================================

clear

echo "=========================================="
echo "             KRNL-DOTS"
echo "          INSTALLATION SYSTEM"
echo "=========================================="

if [[ ! -f /etc/arch-release ]]; then
    error "This installer requires Arch Linux."
    exit 1
fi

if [[ "$EUID" -eq 0 ]]; then
    error "Do not run this script as root."
    exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
    error "sudo is required."
    exit 1
fi

# ==========================================
# INSTALL DEPENDENCIES
# ==========================================

info "Updating package database and installing dependencies..."

sudo pacman -Syu --needed "${DEPENDENCIES[@]}"

success "Dependencies installed."

# ==========================================
# CHECK REPOSITORY
# ==========================================

info "Checking dotfiles repository..."

for pkg in "${PACKAGES[@]}"; do
    if [[ ! -d "$REPO_DIR/$pkg/.config" ]]; then
        error "Missing package directory: $pkg"
        exit 1
    fi
done

success "Repository structure verified."

# ==========================================
# BACKUP AND STOW
# ==========================================

info "Deploying KRNL configurations..."

for pkg in "${PACKAGES[@]}"; do

    SOURCE="$REPO_DIR/$pkg/.config/$pkg"
    TARGET="$HOME/.config/$pkg"

    if [[ ! -d "$SOURCE" ]]; then
        error "Missing source: $SOURCE"
        exit 1
    fi

    # Already linked
    if [[ -L "$TARGET" ]] &&
       [[ "$(readlink -f "$TARGET")" == "$(readlink -f "$SOURCE")" ]]; then
        success "$pkg already linked."
        continue
    fi

    # Backup existing configuration
    if [[ -e "$TARGET" || -L "$TARGET" ]]; then

        if [[ "$BACKUP_CREATED" -eq 0 ]]; then
            mkdir -p "$BACKUP_DIR"
            BACKUP_CREATED=1
        fi

        info "Backing up $pkg..."
        mv "$TARGET" "$BACKUP_DIR/$pkg"
    fi

    # Deploy using Stow
    info "Installing $pkg..."

    if ! stow --dir="$REPO_DIR" --target="$HOME" "$pkg"; then
        error "Failed to stow $pkg."

        # Restore current package backup if available
        if [[ -e "$BACKUP_DIR/$pkg" ]]; then
            mv "$BACKUP_DIR/$pkg" "$TARGET"
        fi

        exit 1
    fi

    success "$pkg installed."

done

# ==========================================
# FINISH
# ==========================================

echo
echo "=========================================="
echo "          KRNL-DOTS INSTALLED"
echo "=========================================="

if [[ "$BACKUP_CREATED" -eq 1 ]]; then
    echo "Backup: $BACKUP_DIR"
fi

echo
echo "Installed configurations:"
printf ' - %s\n' "${PACKAGES[@]}"

echo
success "Installation completed!"
echo
echo "Enjoy your KRNL Linux rice."
echo "=========================================="

#!/bin/bash
set -e

echo "🕷️  Instalando dotfiles de javi..."

# Directorio donde está este script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Actualizar sistema
echo "📦 Actualizando sistema..."
sudo pacman -Syu --noconfirm

# 2. Instalar paquetes de pacman
echo "📦 Instalando paquetes de pacman..."
sudo pacman -S --needed --noconfirm - < "$DOTFILES_DIR/pkglist.txt"

# 3. Instalar flatpaks (solo si hay alguno en la lista)
if [ -s "$DOTFILES_DIR/flatpaklist.txt" ]; then
    echo "📦 Instalando flatpaks..."
    if ! command -v flatpak &> /dev/null; then
        sudo pacman -S --needed --noconfirm flatpak
    fi
    while read -r app; do
        [ -n "$app" ] && flatpak install -y flathub "$app"
    done < "$DOTFILES_DIR/flatpaklist.txt"
fi

# 4. Copiar configs
echo "⚙️  Copiando configuraciones..."
mkdir -p ~/.config

cp -r "$DOTFILES_DIR/config/hypr" ~/.config/
cp -r "$DOTFILES_DIR/config/kitty" ~/.config/
cp -r "$DOTFILES_DIR/config/fastfetch" ~/.config/
cp -r "$DOTFILES_DIR/config/fish" ~/.config/
cp -r "$DOTFILES_DIR/config/waybar" ~/.config/

# 5. Copiar imagen de fastfetch a Descargas
mkdir -p ~/Descargas
cp "$DOTFILES_DIR/config/fastfetch/ore.png" ~/Descargas/

# 6. Dar permisos de ejecución a scripts
chmod +x ~/.config/hypr/scripts/*.sh
echo "✅ Listo! Reinicia sesión para que todo cargue correctamente."

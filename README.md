# 🕷️ Dotfiles de Javi

Configuración personal de mi entorno Arch Linux + Hyprland. Este repo instala automáticamente todos mis paquetes y configuraciones para poder replicar mi setup completo en una máquina nueva en minutos.

## 📦 Qué incluye

- **Hyprland** — compositor Wayland (`hyprland.lua`)
- **Hyprpaper** — wallpaper (`hyprpaper.conf` + imagen)
- **Hyprlock** — pantalla de bloqueo (`hyprlock.conf`)
- **Waybar** — barra superior (`config.jsonc`, `style.css`)
- **Rofi** — launcher de aplicaciones
- **Kitty** — terminal (`kitty.conf`)
- **Fastfetch** — info del sistema con logo personalizado (`config.jsonc` + imagen)
- **Fish** — shell (`config.fish`)
- **Luz nocturna** — script de toggle con `hyprsunset` (`Super + N`)
- Lista completa de paquetes de `pacman` y `flatpak`

## 🚀 Instalación en una máquina nueva

### 1. Instala git (si no lo tienes)

```bash
sudo pacman -S git --needed
```

### 2. Clona este repositorio

```bash
git clone https://github.com/Wuwilaptop/mi-mejor-creaci-n.git
cd mi-mejor-creaci-n
```

### 3. Dale permisos de ejecución al instalador (por si acaso)

```bash
chmod +x install.sh
```

### 4. Corre el instalador

```bash
./install.sh
```

Esto va a:
1. Actualizar el sistema
2. Instalar todos los paquetes de `pacman` listados en `pkglist.txt`
3. Instalar los flatpaks listados en `flatpaklist.txt`
4. Copiar todas las configuraciones a `~/.config/`
5. Dar permisos de ejecución a los scripts necesarios

### 5. Reinicia sesión

Para que Hyprland, Waybar y todo lo demás cargue correctamente con la nueva configuración.

## ⌨️ Atajos personalizados

| Atajo | Acción |
|---|---|
| `Super + N` | Activa/desactiva luz nocturna (hyprsunset) |

## 🔄 Cómo actualizar este repo cuando cambio algo

Si modifico una config y quiero guardar el cambio:

```bash
cd ~/dotfiles
cp ~/.config/hypr/hyprland.lua config/hypr/    # ejemplo, cambia según el archivo modificado
git add .
git commit -m "descripción del cambio"
git push
```

## 📝 Notas

- El instalador asume Arch Linux con `pacman` y `flatpak` configurado (con Flathub como remoto).
- La imagen de fastfetch se copia automáticamente a `~/Descargas/` durante la instalación.

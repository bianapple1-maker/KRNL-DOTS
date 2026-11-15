
<div align="center">

# KRNL-DOTS   

### my linux setup, my own way.

**Dotfiles pribadi punya Bian.**

[Hyprland](https://hyprland.org/) · Arch Linux · Linux Rice

![Preview](assets/preview.png)

Ejeng ie

![Preview](assets/preview2.png)

*I made this setup because default desktop is boring as hell.*

</div>

---

## 🤨 Naon sih ieu?

Jadi ieu teh KRNL-DOTS, kumpulan konfigurasi Linux pribadi nu ku aing dijieun jeung dioprek sorangan.

Aing make Arch Linux jeung Hyprland salaku daily desktop environment. Teu aya maksud nyieun setup paling alus saalam dunya, ngan hayang desktop nu nyaman, enteng, rapih, jeung boga karakter sorangan.

Config-na masih bisa terus robah, jadi ulah heran lamun engke aya update anyar.

## 🖥️ Naon jerona?

| komponenna | Deskripsina |
|---|---|
| Hyprland | Window manager |
| Waybar | Status bar |
| Kitty | Terminal emulator |
| Fastfetch | System information |
| Fuzzel | Application launcher |
| Cava | Audio visualizer |
| Swaybg | Wallpaper manager |

## Ganti wallpaper na
lamun erek ganti wallpaperna maneh kudu pasang lokasi di ~/.config/hypr/hyprland.lua
ti dinya aya startupna swaybg jadi tinggal ganti lokasi na

## 📸 Tah Skrinsut jamsut

<div align="center">

![Desktop Preview](assets/preview.png)

*My current desktop rice.*

</div>

## ⚙️ Depensina jeng kabutuhana

- Arch Linux
- Hyprland
- Internet connection
- sudo privileges

Installer bakal masang dependencies ieu:

- cava
- fastfetch
- fuzzel
- hyprland
- kitty
- waybar
- swaybg
- stow

## 🚀 Installasi

Mun hayang nyobaan config aing, tinggal clone repo ieu:

```bash
git clone https://github.com/bianapple1-maker/KRNL-DOTS.git
```

Asup ka folder-na:

```bash
cd KRNL-DOTS
```

Jalankeun installer:

```bash
chmod +x install.sh
./install.sh
```

Tinggal antosan nepi ka beres.

**Catetan:** Installer ieu husus Arch Linux. Ulah dijalankeun make root.

## 📁 Structure repo

```text
KRNL-DOTS/
│
├── assets/
│   └── preview.png
│
├── cava/
│   └── .config/cava/
│
├── fastfetch/
│   └── .config/fastfetch/
│
├── fuzzel/
│   └── .config/fuzzel/
│
├── hypr/
│   └── .config/hypr/
│
├── kitty/
│   └── .config/kitty/
│
├── waybar/
│   └── .config/waybar/
│
├── install.sh
└── README.md
```

## 💾 Backupna

Ulah hariwang teuing soal config bahela.

Installer bakal nyieun backup konfigurasi nu geus aya di:

```text
~/.config/krnl-backup-YYYYMMDD-HHMMSS
```

Jadi config heubeul teu langsung dipiceun.

## 🛠️ Customisasi na

Mun teu resep kana warna, keybind, layout, atawa tampilan-na, bebas oprek sorangan.

Ieu mah dotfiles, lain barang keramat.

## 👨‍💻 tentang uing

Made by **Bian**.

Arch Linux enthusiast, Linux tinkerer, and someone who enjoys breaking and fixing configs.

Teu kudu sampurna, nu penting jalan jeung aing resep make-na.

---

<div align="center">

**KRNL-DOTS**

*Built with Linux, caffeine, and a lot of terminal commands.*

</div>

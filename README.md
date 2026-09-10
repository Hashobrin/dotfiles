# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Contents

| App | Linux | Windows |
|-----|:-----:|:-------:|
| [Neovim](#neovim) | ✅ | ✅ |
| [WezTerm](#wezterm) | ✅ | ✅ |
| [Hyprland](#hyprland) | ✅ | — |

---

## Prerequisites — chezmoi のインストール

**Linux**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

パッケージマネージャーからも入れられます：

```bash
sudo pacman -S chezmoi   # Arch Linux
sudo apt install chezmoi  # Ubuntu / Debian
sudo dnf install chezmoi  # Fedora
```

**Windows**

```powershell
winget install twpayne.chezmoi
```

### dotfiles の適用

```bash
chezmoi init --apply https://github.com/Hashobrin/dotfiles.git
```

以降の更新：

```bash
chezmoi update
```

---

## Neovim

[LazyVim](https://www.lazyvim.org/) ベースの設定。

### インストール — Linux

```bash
# Arch Linux
sudo pacman -S neovim

# Ubuntu / Debian（公式リポジトリは古いため PPA を使用）
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install neovim

# Fedora
sudo dnf install neovim
```

依存ツール：

```bash
# Arch Linux
sudo pacman -S ripgrep fd nodejs npm

# Ubuntu / Debian
sudo apt install ripgrep fd-find nodejs npm

# Fedora
sudo dnf install ripgrep fd-find nodejs npm
```

### インストール — Windows

```powershell
winget install Neovim.Neovim
winget install BurntSushi.ripgrep.MSVC  # ripgrep
winget install sharkdp.fd               # fd
winget install OpenJS.NodeJS.LTS        # Node.js
```

### 設定の反映

```bash
chezmoi apply
```

`~/.config/nvim/` に展開されます。

### 初回起動

```bash
nvim
```

LazyVim が自動でプラグインをインストールします。起動後に `:checkhealth` で不足ツールを確認できます。

> **Windows の注意点**  
> 既存キャッシュが残っていてエラーが出る場合は削除してから再起動してください：
> ```powershell
> Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data
> ```

---

## WezTerm

### インストール — Linux

```bash
# Arch Linux
sudo pacman -S wezterm

# Fedora
sudo dnf install wezterm

# Ubuntu / Debian（ナイトリー推奨）
# https://github.com/wezterm/wezterm/releases/tag/nightly から
# WezTerm-nightly.Ubuntu22.04.AppImage 等をダウンロード
```

### インストール — Windows

```powershell
winget install wez.wezterm
```

> **注意:** winget の安定版（`20240203`）は一部の設定項目に未対応です。  
> ナイトリービルドを使用する場合は [こちら](https://github.com/wezterm/wezterm/releases/tag/nightly) から `WezTerm-nightly-setup.exe` をダウンロードしてインストールしてください。

### 設定の反映

```bash
chezmoi apply
```

`~/.config/wezterm/wezterm.lua` に展開されます。WezTerm を再起動すると反映されます。

---

## Hyprland

> Linux のみ対応

### インストール — Linux

```bash
# Arch Linux
sudo pacman -S hyprland

# その他のディストリビューション:
# https://wiki.hyprland.org/Getting-Started/Installation/
```

### 設定の反映

```bash
chezmoi apply
```

`~/.config/hypr/` に展開されます。

---

## Tips

設定を変更する場合は chezmoi 経由で行うと変更がリポジトリに追跡されます：

```bash
# ファイルを chezmoi エディタで開く
chezmoi edit ~/.config/nvim/init.lua

# 変更を適用
chezmoi apply

# リポジトリにコミット
chezmoi cd
git add .
git commit -m "update config"
git push
```

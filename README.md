# dotfiles

Personal dotfiles configuration for a customized ZSH development environment with enhanced autocomplete, syntax highlighting, and a modern shell prompt.

## Overview

This repository contains configuration files for setting up a productive ZSH environment with:

- **Starship prompt** - Fast, customizable, and minimal shell prompt
- **ZSH plugins** for enhanced functionality:
  - `zsh-autosuggestions` - Fish-like autosuggestions
  - `zsh-autocomplete` - Real-time type-ahead completion
  - `fast-syntax-highlighting` - Feature-rich syntax highlighting
- **GPG commit signing** configuration
- **Custom aliases** support (optional)
- **Custom bin directory** for personal scripts (optional)

## Prerequisites

- **ZSH** shell installed on your system
- **Git** for cloning plugin repositories
- **curl** for installing Starship
- **sudo** access for changing default shell and installing packages

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

3. Log out and log back in for the shell change to take effect.

## What the Install Script Does

The [install.sh](install.sh) script performs the following actions:

1. **Validates ZSH installation** - Exits if ZSH is not installed
2. **Creates necessary directories**:
   - `~/.config` - Configuration directory
   - `~/.zsh_addons` - ZSH plugins directory
3. **Creates symlinks** for dotfiles:
   - `.zshrc` → `~/.zshrc`
   - `.aliases` → `~/.aliases` (if exists)
   - `bin/` → `~/bin` (if exists)
4. **Installs ZSH plugins**:
   - Clones zsh-autosuggestions
   - Clones zsh-autocomplete
   - Clones fast-syntax-highlighting
5. **Installs Starship** prompt using the official installer
6. **Changes default shell** to ZSH
7. **Installs gnupg2** via apt-get
8. **Configures Git**:
   - Enables GPG commit signing
   - Sets signing key to `2D788AC58758D448`

## Configuration Files

### [.zshrc](.zshrc)

The main ZSH configuration file that:
- Sets ZSH as the default shell
- Adds `~/bin` to PATH if it exists
- Enables interactive comments for autocomplete
- Sources `.aliases` and `.aliases.local` if they exist
- Loads all ZSH plugins
- Configures Poetry completions (if Poetry is installed)
- Initializes Starship prompt

### .aliases (optional)

Create a `.aliases` file in this repository to define custom shell aliases. This file will be symlinked to `~/.aliases` and automatically sourced by `.zshrc`.

### .aliases.local (optional)

For machine-specific aliases, create `~/.aliases.local` in your home directory. This file is sourced if it exists but is not managed by this repository.

### bin/ (optional)

Create a `bin/` directory in this repository for custom scripts. It will be symlinked to `~/bin` and added to your PATH.

## Customization

### Starship Configuration

To customize the Starship prompt, create a configuration file at `~/.config/starship.toml`. See the [Starship documentation](https://starship.rs/config/) for available options.

### GPG Signing Key

The install script configures Git to use GPG key `2D788AC58758D448`. To use your own key:

1. Update the key ID in [install.sh](install.sh):56
2. Ensure your GPG key is available in the environment (the script expects GPG agent forwarding in containerized environments)

### Adding More Plugins

To add additional ZSH plugins, edit [install.sh](install.sh) to clone the plugin repository and update [.zshrc](.zshrc) to source the plugin file.

## Uninstallation

To remove the configuration:

```bash
# Remove symlinks
rm ~/.zshrc ~/.aliases ~/bin

# Remove plugins
rm -rf ~/.zsh_addons

# Change shell back to bash (or your preferred shell)
sudo chsh -s /bin/bash

# Uninstall Starship (optional)
rm ~/.local/bin/starship
```

## Notes

- The installation script removes existing dotfile symlinks before creating new ones
- GPG commit signing requires GPG agent to be properly configured
- The script is designed to work in containerized environments (e.g., devcontainers)
- Poetry completions are automatically configured if Poetry is detected

## Troubleshooting

**"zsh is not installed" error**: Install ZSH using your package manager:
- Ubuntu/Debian: `sudo apt-get install zsh`
- macOS: `brew install zsh`
- Fedora: `sudo dnf install zsh`

**Plugin errors on shell startup**: Ensure all plugins were cloned successfully. Re-run the install script.

**GPG signing fails**: Verify your GPG key is available with `gpg --list-secret-keys` and that the key ID in the install script matches your key.

## License

See [LICENSE](LICENSE) file for details.

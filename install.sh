#!/bin/bash

# install_packages.sh
# This script installs a predefined list of packages using yay for Arch Linux based systems.
# It ensures yay is installed, updates the system, and then installs the specified packages.

# Exit immediately if a command exits with a non-zero status (error checking).
set -e

# --- Configuration ---
# List of packages to install, derived from the user's command.
# You can add or remove packages from this list as needed.
PACKAGES_TO_INSTALL=(
    kitty
    hyprland
    visual-studio-code-bin
    wofi
    waybar
    hyprshot
    swaync
    stow
    firefox-developer-edition
    obsidian
    hyprpaper
    starship
    ttf-font-awesome
    ttf-jetbrains-mono
    neofetch
    catppuccin-gtk-theme-mocha
    ttf-cascadia-code-nerd
    nvim
    nodejs
    npm
)

# --- Helper Functions ---
# Function to check if a command exists.
# Usage: command_exists "command_name"
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# --- Main Script Logic ---
main() {
    echo "==================================================="
    echo " Arch Linux Package Installation Script (via yay) "
    echo "==================================================="
    echo

    # 1. Check if yay is installed
    echo "Checking for yay (AUR Helper)..."
    if ! command_exists yay; then
        echo -e "\033[31mError: yay is not installed.\033[0m" # Red color for error
        echo "yay is an AUR helper required to install some of these packages."
        echo "Please install yay first. A common method is:"
        echo "  1. Ensure 'base-devel' and 'git' are installed: sudo pacman -S --needed base-devel git"
        echo "  2. Clone the yay PKGBUILD: git clone https://aur.archlinux.org/yay.git"
        echo "  3. Navigate into the directory: cd yay"
        echo "  4. Build and install the package: makepkg -si"
        echo "  5. Clean up: cd .. && rm -rf yay"
        echo
        echo "Aborting script."
        exit 1
    else
        echo -e "\033[32myay is installed and available.\033[0m" # Green color for success
    fi
    echo

    # 2. List packages and ask for confirmation
    echo "The following packages are scheduled for installation/update:"
    for pkg in "${PACKAGES_TO_INSTALL[@]}"; do
        echo "  - $pkg"
    done
    echo
    echo "This script will use 'yay -Syu --needed ...' which means:"
    echo "  - '-Syu': Synchronize package databases and upgrade all currently installed system packages."
    echo "  - '--needed': Only install/upgrade packages that are not already up-to-date."
    echo
    echo "During the process, yay will:"
    echo "  - Ask for your sudo password to perform system-wide changes."
    echo "  - Prompt for choices if multiple providers exist for a package."
    echo "  - Allow you to review PKGBUILDs for AUR packages before building."
    echo

    read -r -p "Do you want to proceed with the system update and package installation? (y/N): " response
    if ! [[ "${response,,}" =~ ^(y|yes)$ ]]; then # Convert response to lowercase and check
        echo "Installation aborted by user."
        exit 0
    fi
    echo

    # 3. Perform the installation
    echo "---------------------------------------------------"
    echo "Attempting to update system and install packages..."
    echo "This may take a significant amount of time depending on your system and internet speed."
    echo "Please be patient and follow any prompts from yay."
    echo "---------------------------------------------------"

    # The core command:
    # yay will handle official repository and AUR packages.
    # -Syu: Synchronizes repositories and updates all system packages.
    # --needed: Skips packages that are already installed and up-to-date.
    # "${PACKAGES_TO_INSTALL[@]}": Expands the array of packages.
    if yay -Syu --needed "${PACKAGES_TO_INSTALL[@]}"; then
        echo
        echo -e "\033[32m==================================================="
        echo -e " System update and package installation completed successfully! "
        echo -e "===================================================\033[0m"
    else
        echo
        echo -e "\033[31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo -e " An error occurred during the installation process. "
        echo -e " Please review the output above for specific error messages from yay. "
        echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\033[0m"
        exit 1 # Exit with an error code
    fi
    echo

    # 4. Post-installation advice
    echo "---------------------------------------------------"
    echo "Post-Installation Notes & Recommendations:"
    echo "---------------------------------------------------"
    echo "  - **Reboot/Relogin**: Some changes (especially fonts, GTK themes, or desktop environment components like Hyprland) may require you to log out and log back in, or even reboot your system, to take full effect."
    echo "  - **Configuration**: Most of the installed applications will require further configuration:"
    echo "    - Hyprland, Waybar, Wofi: Create or customize their respective configuration files (e.g., `~/.config/hypr/hyprland.conf`)."
    echo "    - Kitty: Customize `~/.config/kitty/kitty.conf`."
    echo "    - Starship: Configure `~/.config/starship.toml`."
    echo "    - Neovim (nvim): Set up your `~/.config/nvim/init.vim` or `~/.config/nvim/init.lua`."
    echo "    - GTK Theme (Catppuccin): You may need to use a tool like `lxappearance` or `nwg-look` (for Wayland) to apply GTK themes, or set it via gsettings."
    echo "  - **Dotfiles**: The 'stow' package is installed. Consider using it to manage your configuration files (dotfiles) from a central repository."
    echo "  - **Documentation**: For detailed setup and usage, refer to the Arch Wiki and the official documentation for each installed package."
    echo
    echo "Script execution finished."
}

# --- Script Entry Point ---
# This ensures the main logic runs when the script is executed.
# "$@" passes all command-line arguments to the main function, though not used in this version.
main "$@"

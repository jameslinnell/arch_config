# arch_config

## Arch Linux install
- Once the live CD/USB has booted into the terminal run...
- - archinstall
  - Select the following options...
  - - Language = (Your language)
    - Mirrors (Your local mirror)
    - Locales (Your locale)
    - Disk Configuration
    - - Partitioning -> Use a best effort.... -> Select your HDD -> ext4
    - Root password (make it up)
    - User account (create an account with sudo access)
    - Profile (Leave blank)
    - Additional packages (Add `git`)
    - Network configuration (Use Network Manager)
  - Install
  - Select `no` when prompted to CHROOT
  - type `shutdown -r now`
- - On reboot select `Boot into existing Arch Linux`

## Configure
- Login to the terminal using the credentials you setup in the install process

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./cyber.nix
    ./gaming.nix
    ./amd.nix
  ];

  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.sddm.enable = false;

  fonts.packages = [
  	pkgs.nerd-fonts._0xproto
        pkgs.nerd-fonts.droid-sans-mono
  ];
  nix.settings = { download-buffer-size = 33554432; };

  services.power-profiles-daemon.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Virtual
  virtualisation.virtualbox.host.enable = true;

  #BlueTooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # unfree enablr
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };
  programs.bash = {
    interactiveShellInit =
      "  if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != \"fish\" && -z \${BASH_EXECUTION_STRING} ]]\n  then\n    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=\"\"\n    exec ${pkgs.fish}/bin/fish $LOGIN_OPTION\n  fi\n";
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";

  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mifd = {
    isNormalUser = true;
    description = "mifd";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
      [
        #  thunderbird
      ];
  };


  programs.nix-ld.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  security.pam.services.swaylock = { };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    swww
    kitty
    python3
    gcc
    tldr
    cargo
    rustc
    fish
    unzip
    wofi
    ripgrep
    eza
    wl-clipboard
    libsForQt5.dolphin
    ranger
    wget
    gnumake
    ffmpeg
    moonlight-qt
    libva
    libva-utils
    libva-vdpau-driver
    libvdpau
    bat
    btop
    dotnet-sdk_9
  ];

  environment.variables = {
    # This tells Java to use Wayland (prevents issues with Java windowing)
    _JAVA_AWT_WM_NONREPARENTING = "1";
    DOTNET_ROOT = "/nix/store/j7w50zcrv5rybkj23vqw062zry8gn1wx-dotnet-sdk-9.0.203/share/dotnet/";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

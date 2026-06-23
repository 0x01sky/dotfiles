{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sky";
  home.homeDirectory = "/home/sky";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.
  
  # git config

  programs.git = {
    enable = true;

    settings = {
       
       user.name = "sky";
       user.email = "sky@git.org";

       alias = {
         st = "status";
         lg = "log --oneline --graph --decorate";
         psh = "push";
         pl = "pull";
         rv = "revert";
         rsh = "reset --hard";
         rao = "remote add origin";
       };

     core.editor = "nvim";
   };
};


  # Enabling zsh

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "cloud";
    
      plugins = [
       "git"
       "sudo"
       "command-not-found"
       "history"
     ];
  };

  shellAliases = {
    ls = "lsd -lA";
    nv = "nvim";
    nrs = "sudo nixos-rebuild switch";
    d = "duf";
    hms = "home-manager switch";
    hm = "home-manager";
    nn = "nano";
    src = "source";
    cat = "bat";
  };
};

  home.packages = [
    pkgs.hello
    pkgs.cowsay
    pkgs.figlet
    pkgs.gh
    pkgs.cpufetch
    pkgs.nodejs
    pkgs.uv
    pkgs.unzip
    pkgs.zip
    pkgs.lua-language-server
    pkgs.rustc
    pkgs.cargo
    pkgs.zls
    pkgs.clang-tools
    pkgs.rust-analyzer
    pkgs.fzf
    pkgs.lsd
    pkgs.bat
    pkgs.zsh-completions
    pkgs.zsh-autosuggestions
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sky/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

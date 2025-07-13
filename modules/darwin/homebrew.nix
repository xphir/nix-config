{
  lib,
  config,
  ...
}: {
  homebrew = {
    enable = true;

    taps = [
    ];

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # `brew install`
    brews = [
      "wget" # download tool
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
    ];

    # `brew install --cask`
    casks =
      [
        "ghostty" # Terminal emulator that uses platform-native UI and GPU acceleration
        "firefox" # Web browser
        # "google-chrome"
        # "zen"
        "the-unarchiver" # Unpacks archive files
        "alt-tab" # Enable Windows-like alt-tab

        # "bettertouchtool"

        # messengers
        # "signal"

        # "itsycal"
        "iina"
        "raycast" # (HotKey: alt/option + space)search, calculate and run scripts(with many plugins)
        "stats" # beautiful system status monitor in menu bar
        # "monitorcontrol"

        "font-sf-pro" # San Francisco Pro, SF Pro
        "sf-symbols" # Tool that provides consistent, highly configurable symbols for apps
        "balenaetcher" # Flash OS images to SD cards & USB drives, safely and easily.

        # "android-platform-tools"
        # "android-file-transfer"
        # "android-studio"
        "localsend" # Share files to nearby devices. Free, open-source, cross-platform.
        # "transnomino" # A batch rename utility for the Mac
        # "handbrake" # Open-source video transcoder available for Linux, Mac, and Windows
        "obsidian" # Knowledge base that works on top of a local folder of plain text Markdown files

        "rectangle" # a window management app based on Spectacle
        "steam" # Video game digital distribution service
        "orbstack" # Lightweight, fast, and secure virtualization for macOS
      ]
      ++ lib.optionals config.personal.enable [
        # "cursor"
        "visual-studio-code"
        # "slack"
        # "zoom"
      ];

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      # Xcode = 497799835;
      #   wireguard = 1451685025;
      Bitwarden = 1352778147;
    };
  };

  # Add Homebrew paths to the session path
  environment.systemPath = lib.mkBefore [
    # "/usr/local/bin" # intel mac
    "/opt/homebrew/bin" # mX mac
    "/opt/homebrew/sbin"
  ];
}

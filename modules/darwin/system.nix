{
  pkgs,
  myvars,
  ...
}:
###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#  Incomplete list of macOS `defaults` commands :
#    https://github.com/yannbertrand/macos-defaults
#
###################################################################################
{
  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  time.timeZone = "Australia/Melbourne";

  system = {
    # Set the primary user for system-wide configurations
    primaryUser = myvars.username;

    # Proper system activation script
    # activationScripts.extraActivation.text = ''
    #   # activateSettings -u will reload the settings from the database and apply them to the current session
    #   /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    # '';

    defaults = {
      LaunchServices.LSQuarantine = false;
      # customize dock
      dock = {
        autohide = false;
        autohide-delay = 1.0;
        autohide-time-modifier = 0.0;
        launchanim = false;
        mineffect = "scale";
        mru-spaces = false;
        orientation = "bottom";
        persistent-apps = [];
        persistent-others = [];
        show-recents = false;
        tilesize = 50;

        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
      };

      # customize finder
      finder = {
        AppleShowAllExtensions = true; # show all file extensions
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        FXPreferredViewStyle = "clmv";
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar

        _FXShowPosixPathInTitle = true; # show full path in finder title
        _FXSortFoldersFirst = true;

        # Additional useful finder settings
        ShowTabView = false; # Disable tab view
        NewWindowTarget = "PfHm"; # New windows open to home directory
        FXInfoPanesExpanded = {
          General = true; # Expand general pane in Get Info
          OpenWith = true; # Expand open with pane in Get Info
          Privileges = true; # Expand privileges pane in Get Info
        };
      };

      # customize trackpad
      trackpad = {
        Clicking = true; # enable tap to click(Tapping the touchpad is equivalent to clicking)
        TrackpadRightClick = true; # enable two finger right click
        TrackpadThreeFingerDrag = true; # enable three finger drag
      };

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        #AppleEnableMouseSwipeNavigateWithScrolls = false; # Enables swiping left or right with two fingers to navigate backward or forward
        #AppleEnableSwipeNavigateWithScrolls = false; # Enables swiping left or right with two fingers to navigate backward or forward
        AppleICUForce24HourTime = false;
        AppleInterfaceStyle = "Dark"; # dark mode
        AppleKeyboardUIMode = 3; # Mode 3 enables full keyboard control.
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        ApplePressAndHoldEnabled = false; # enable press and hold. It will display a popup allowing you pick a special character
        AppleScrollerPagingBehavior = false; # Jump to the spot that's clicked on the scroll bar. The default is false.
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleShowScrollBars = "Always"; # When to show the scrollbars. Options are 'WhenScrolling', 'Automatic' and 'Always'.
        AppleSpacesSwitchOnActivate = true; # Whether or not to switch to a workspace that has a window of the application open, that is switched to. The default is true.
        AppleTemperatureUnit = "Celsius";
        AppleWindowTabbingMode = "fullscreen"; # Sets the window tabbing when opening a new document: 'manual', 'always', or 'fullscreen'. The default is 'fullscreen'.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts.
        KeyRepeat = 2; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false; # disable auto capitalization
        NSAutomaticDashSubstitutionEnabled = false; # disable auto dash substitution
        NSAutomaticInlinePredictionEnabled = false; # Whether to enable inline predictive text. The default is true.
        NSAutomaticPeriodSubstitutionEnabled = false; # disable auto period substitution
        NSAutomaticQuoteSubstitutionEnabled = false; # disable auto quote substitution
        NSAutomaticSpellingCorrectionEnabled = false; # disable auto spelling correction
        NSAutomaticWindowAnimationsEnabled = false; # Whether to animate opening and closing of windows and popovers. The default is true.
        NSDisableAutomaticTermination = false; # Whether to disable the automatic termination of inactive apps.
        NSDocumentSaveNewDocumentsToCloud = false; # Whether to save new documents to iCloud by default. The default is true.
        NSNavPanelExpandedStateForSaveMode = true; # expand save panel by default
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSScrollAnimationEnabled = true;
        NSTableViewDefaultSizeMode = 2; # Sets the size of the finder sidebar icons: 1 (small), 2 (medium) or 3 (large). The default is 3.
        NSWindowShouldDragOnGesture = true;

        # File system and file handling
        NSFileViewer.ShowSidebar = true; # Show sidebar in file dialogs
        NSToolbar.FullScreenMenuBarVisible = true; # Show menu bar in full screen

        # Keyboard and input settings
        NSUserKeyEquivalents = {
          # Add some useful global shortcuts
          "Minimize" = "@m"; # Cmd+M to minimize
          "Zoom" = "@^z"; # Cmd+Ctrl+Z to zoom
        };

        # Performance and system behavior
        NSAppSleepDisabled = true; # Prevent apps from being put to sleep
        NSQuitAlwaysKeepsWindows = false; # Don't restore windows on app relaunch
        NSScrollViewRubberbanding = true; # Enable rubber band scrolling
        NSUseAnimatedFocusRing = false; # Disable animated focus ring for performance

        # Development and debugging
        NSShowNonLocalizedStrings = false; # Don't show non-localized strings
        WebKitDeveloperExtras = true; # Enable WebKit developer tools globally

        _HIHideMenuBar = false;
        "com.apple.mouse.tapBehavior" = 1; # Configures the trackpad tap behavior. Mode 1 enables tap to click.
        "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key
        "com.apple.swipescrolldirection" = false; # disable natural scrolling(default to true)
        "com.apple.trackpad.enableSecondaryClick" = true;
      };

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      WindowManager = {
        AppWindowGroupingBehavior = false;
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };

      menuExtraClock = {
        IsAnalog = false;
        Show24Hour = true;
        ShowDate = 2; # 0 = When space allows 1 = Always 2 = Never
        ShowDayOfWeek = false;
        ShowSeconds = false;
      };

      screencapture = {
        location = "~/Pictures/screenshots";
        show-thumbnail = true;
        type = "png";
      };

      screensaver = {
        # Require password immediately after sleep or screen saver begins
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      # true for Aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
      spaces.spans-displays = true; # false = each physical display has a separate space (Mac default) true = one space spans across all physical displays

      loginwindow = {
        GuestEnabled = false; # disable guest user
        SHOWFULLNAME = true; # show full name in login window
        # Additional security settings
        DisableConsoleAccess = true; # Disable console access from login window
        PowerOffDisabledWhileLoggedIn = true; # Disable power off when user is logged in
        RestartDisabledWhileLoggedIn = true; # Disable restart when user is logged in
        ShutDownDisabledWhileLoggedIn = true; # Disable shutdown when user is logged in
        SleepDisabledWhileLoggedIn = false; # Allow sleep when user is logged in
      };

      # universalaccess.reduceMotion = true;  # TODO causes error

      # Activity Monitor settings
      ActivityMonitor = {
        IconType = 5; # Show CPU usage in dock icon
        SortColumn = "CPUUsage";
        SortDirection = 0;
      };

      # Bluetooth settings
      bluetooth = {
        BluetoothAudioEnableAAC = true; # Enable AAC codec for better audio quality
      };

      # Energy and power settings
      pmset = {
        powernap = false; # Disable Power Nap to save battery
        womp = false; # Disable wake on network access
        ring = false; # Disable wake on modem ring
        autorestart = false; # Disable automatic restart on power loss
        displaysleep = 10; # Display sleep after 10 minutes
        sleep = 30; # System sleep after 30 minutes on battery
        disksleep = 10; # Disk sleep after 10 minutes
      };

      # Customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;

        # Safari settings for development
        "com.apple.Safari" = {
          IncludeInternalDebugMenu = true; # Enable Safari's debug menu
          IncludeDevelopMenu = true; # Enable Safari's develop menu
          WebKitDeveloperExtrasEnabledPreferenceKey = true; # Enable web inspector
          WebKitPreferences.developerExtrasEnabled = true;
          # Show full URL in address bar
          ShowFullURLInSmartSearchField = true;
          # Disable auto-fill
          AutoFillFromAddressBook = false;
          AutoFillPasswords = false;
          AutoFillCreditCardData = false;
          AutoFillMiscellaneousForms = false;
        };

        # Terminal settings
        "com.apple.Terminal" = {
          StringEncodings = [4]; # UTF-8 encoding
          SecureKeyboardEntry = true; # Enable secure keyboard entry
        };

        # TextEdit settings - plain text by default
        "com.apple.TextEdit" = {
          RichText = false; # Default to plain text
          PlainTextEncoding = 4; # UTF-8
          PlainTextEncodingForWrite = 4; # UTF-8
        };

        # Disk Utility settings
        "com.apple.DiskUtility" = {
          DUDebugMenuEnabled = true; # Enable debug menu
          advanced-image-options = true; # Show advanced options
        };

        # Console app settings
        "com.apple.Console" = {
          UseLogTimestamps = true; # Show timestamps in logs
        };

        # Security and privacy
        "com.apple.LaunchServices" = {
          LSHandlers = [
            {
              LSHandlerContentType = "public.unix-executable";
              LSHandlerRoleShell = "com.apple.Terminal";
            }
          ];
        };

        # Time Machine settings
        "com.apple.TimeMachine" = {
          DoNotOfferNewDisksForBackup = true; # Don't prompt for new backup disks
        };

        # Network settings
        "com.apple.NetworkBrowser" = {
          BrowseAllInterfaces = true; # Show all network interfaces
          DisableAirDrop = false; # Keep AirDrop enabled
        };

        # QuickLook settings
        "com.apple.finder" = {
          QLEnableTextSelection = true; # Enable text selection in QuickLook
        };

        # Crash Reporter settings
        "com.apple.CrashReporter" = {
          UseUNC = 1; # Use unchecked crash reporting
        };

        # Keyboard shortcuts are configured in keyboard-shortcuts.nix
      };
    };

    # keyboard settings is not very useful on macOS
    # the most important thing is to remap option key to alt key globally,
    # but it's not supported by macOS yet.
    keyboard = {
      enableKeyMapping = true; # enable key mapping so that we can use `option` as `control`

      # NOTE: do NOT support remap capslock to both control and escape at the same time
      remapCapsLockToControl = true; # remap caps lock to control, useful for emac users
      remapCapsLockToEscape = false; # remap caps lock to escape, udfsseful for vim users

      # swap left command and left alt
      # so it matches common keyboard layout: `ctrl | command | alt`
      #
      # disabled, caused only problems!
      swapLeftCommandAndLeftAlt = false;
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # Set default shell for user
  users.users.${myvars.username} = {
    shell = pkgs.zsh;
  };

  #Fonts
  fonts.packages = with pkgs; [
    # icon fonts
    material-design-icons
    font-awesome
    sketchybar-app-font

    # nerdfonts
    # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/data/fonts/nerdfonts/shas.nix
    # symbols icon only
    nerd-fonts.symbols-only
    # Characters
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
    nerd-fonts.hack
  ];
}

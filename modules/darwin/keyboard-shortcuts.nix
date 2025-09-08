{...}: {
  system.defaults.CustomUserPreferences."com.apple.symbolichotkeys" = {
    AppleSymbolicHotKeys = {
      #############################################################################
      # EXPOSE AND MISSION CONTROL
      #############################################################################
      
      # "7" = { enabled = true; }; # All windows (F3) - keep default
      # "8" = { enabled = true; }; # Application windows (F4) - keep default
      # "9" = { enabled = true; }; # Desktop (F11) - keep default
      # "10" = { enabled = true; }; # Dashboard (F12) - keep default
      
      # Override Mission Control with Control + K
      "32" = {
        enabled = true;
        value = {
          parameters = [107 40 1310720]; 
          type = "standard";
        };
      };

      # Override Application windows with Control + J
      "33" = {
        enabled = true;
        value = {
          parameters = [106 38 1310720];
          type = "standard";
        };
      };

      #############################################################################
      # SPACES NAVIGATION
      #############################################################################
      
      # Move left a space (Ctrl + Left Arrow)
      "79" = {
        enabled = true;
        value = {
          parameters = [123 123 1310720];
          type = "standard";
        };
      };
      
      # Move right a space (Ctrl + Right Arrow)
      "81" = {
        enabled = true;
        value = {
          parameters = [124 124 1310720];
          type = "standard";
        };
      };
      
      # Switch to Desktop 1 (Ctrl + 1)
      "118" = {
        enabled = true;
        value = {
          parameters = [18 18 1310720];
          type = "standard";
        };
      };
      
      # Switch to Desktop 2 (Ctrl + 2)
      "119" = {
        enabled = true;
        value = {
          parameters = [19 19 1310720];
          type = "standard";
        };
      };
      
      # Switch to Desktop 3 (Ctrl + 3)
      "120" = {
        enabled = true;
        value = {
          parameters = [20 20 1310720];
          type = "standard";
        };
      };
      
      # Switch to Desktop 4 (Ctrl + 4)
      "121" = {
        enabled = true;
        value = {
          parameters = [21 21 1310720];
          type = "standard";
        };
      };

      #############################################################################
      # SEARCH AND SPOTLIGHT (DISABLED)
      #############################################################################
      
      # Disable Spotlight Search (Cmd + Space)
      "64" = {
        enabled = false;
      };
      
      # Disable Finder search window (Cmd + Alt + Space)
      "65" = {
        enabled = false;
      };

      #############################################################################
      # INPUT SOURCES (DISABLED)
      #############################################################################
      
      # Disable previous input source (Ctrl + Space)
      "60" = {
        enabled = false;
      };
      
      # Disable next input source (Ctrl + Option + Space)
      "61" = {
        enabled = false;
      };

      #############################################################################
      # DOCK AND MENU BAR
      #############################################################################
      
      # Turn Dock Hiding On/Off (Cmd + Option + D)
      "11" = {
        enabled = true;
        value = {
          parameters = [100 2 1572864];
          type = "standard";
        };
      };
      
      # Show/Hide Dock (varies by system)
      "52" = {
        enabled = true;
      };
      
      # Show/Hide Menu Bar (varies by system)
      "53" = {
        enabled = true;
      };

      #############################################################################
      # WINDOW MANAGEMENT
      #############################################################################
      
      # Cycle through windows (Cmd + `)
      "47" = {
        enabled = true;
        value = {
          parameters = [50 50 1048576];
          type = "standard";
        };
      };
      
      # Focus on next window (F6)
      "51" = {
        enabled = true;
        value = {
          parameters = [97 97 0];
          type = "standard";
        };
      };
      
      # Minimize window (Cmd + M)
      "45" = {
        enabled = true;
        value = {
          parameters = [46 46 1048576];
          type = "standard";
        };
      };
      
      # Minimize all windows of the front application (Cmd + Option + M)
      "46" = {
        enabled = true;
        value = {
          parameters = [46 46 1572864];
          type = "standard";
        };
      };

      #############################################################################
      # APPLICATION MANAGEMENT
      #############################################################################
      
      # Hide application (Cmd + H)
      "37" = {
        enabled = true;
        value = {
          parameters = [4 4 1048576];
          type = "standard";
        };
      };
      
      # Hide others (Cmd + Option + H)
      "38" = {
        enabled = true;
        value = {
          parameters = [4 4 1572864];
          type = "standard";
        };
      };
      
      # Quit application (Cmd + Q)
      "42" = {
        enabled = true;
        value = {
          parameters = [12 12 1048576];
          type = "standard";
        };
      };

      #############################################################################
      # SCREENSHOTS
      #############################################################################
      
      # Save picture of screen as a file (Cmd + Shift + 3)
      "28" = {
        enabled = true;
        value = {
          parameters = [20 20 1179648];
          type = "standard";
        };
      };
      
      # Copy picture of screen to the clipboard (Cmd + Ctrl + Shift + 3)
      "29" = {
        enabled = true;
        value = {
          parameters = [20 20 1441792];
          type = "standard";
        };
      };
      
      # Save picture of selected area as a file (Cmd + Shift + 4)
      "30" = {
        enabled = true;
        value = {
          parameters = [21 21 1179648];
          type = "standard";
        };
      };
      
      # Copy picture of selected area to the clipboard (Cmd + Ctrl + Shift + 4)
      "31" = {
        enabled = true;
        value = {
          parameters = [21 21 1441792];
          type = "standard";
        };
      };

      #############################################################################
      # UNIVERSAL ACCESS / ACCESSIBILITY
      #############################################################################
      
      # Turn zoom on or off (Cmd + Option + 8)
      "15" = {
        enabled = true;
        value = {
          parameters = [28 28 1572864];
          type = "standard";
        };
      };
      
      # Zoom in (Cmd + Option + =)
      "17" = {
        enabled = true;
        value = {
          parameters = [24 24 1572864];
          type = "standard";
        };
      };
      
      # Zoom out (Cmd + Option + -)
      "19" = {
        enabled = true;
        value = {
          parameters = [27 27 1572864];
          type = "standard";
        };
      };
      
      # Invert colors (Cmd + Option + Ctrl + 8)
      "21" = {
        enabled = true;
        value = {
          parameters = [28 28 1835008];
          type = "standard";
        };
      };

      #############################################################################
      # SERVICES AND MISCELLANEOUS
      #############################################################################
      
      # Turn text to speech on/off (varies by system)
      "59" = {
        enabled = true;
      };
    };
  };
}

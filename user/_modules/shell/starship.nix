{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_status"
        "$docker_context"
        "$package"

        "$fill"

        "$c"
        "$cpp"
        "$cmake"
        "$golang"
        "$java"
        "$lua"
        "$nodejs"
        "$perl"
        "$python"
        "$ruby"
        "$rust"

        "$nix_shell"

        "$cmd_duration"

        "$line_break"

        "$jobs"
        "$battery"
        "$status"
        "$container"
        "$shlvl"
        "$character"
      ];

      # left side segments - core

      username = {
        show_always = true;
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        format = "@[$hostname]($style) ";
        style = "bold green";
      };

      directory = {
        format = "[|](bright-black) [$read_only]($read_only_style)[$path]($style) ";
        read_only = "R ";
        style = "bold blue";
        truncate_to_repo = false;
        truncation_length = 3;
        truncation_symbol = ".../";
      };

      # left side segments - dev / container

      git_branch = {
        symbol = "";
        truncation_symbol = "...";
      };

      git_commit = {
        tag_symbol = " tag ";
      };

      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };

      docker_context = {
        symbol = "docker";
        format = "[|](bright-black) [$symbol $context]($style) ";
      };

      package = {
        symbol = "pkg";
        format = "[|](bright-black) [$symbol $version]($style) ";
      };

      # fill

      fill = {
        style = "bright-black";
      };

      # right side segments - languages

      c = {
        symbol = "C";
        format = " [$symbol ($version(-$name) )]($style)[|](bright-black)";
      };

      cpp = {
        symbol = "C++";
        format = " [$symbol ($version(-$name) )]($style)[|](bright-black)";
      };

      cmake = {
        symbol = "cmake";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      golang = {
        symbol = "go";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      java = {
        symbol = "java";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      lua = {
        symbol = "lua";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      nodejs = {
        symbol = "nodejs";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      perl = {
        symbol = "pl";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      python = {
        symbol = "py";
        format = " [$symbol ($version )(\\($virtualenv\\) )]($style)[|](bright-black)";
      };

      ruby = {
        symbol = "rb";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      rust = {
        symbol = "rs";
        format = " [$symbol ($version )]($style)[|](bright-black)";
      };

      # right side segments - other

      nix_shell = {
        symbol = "nix";
        format = " [$symbol (\\($name\\) )]($style)[|](bright-black)";
      };

      # command duration

      cmd_duration = {
        format = " [$duration]($style)";
        style = "white";
        min_time = 0;
      };

      # command line segments

      jobs = {
      };

      battery = {
      };

      status = {
        disabled = false;
        symbol = "";
      };

      container = {
      };

      shlvl = {
        disabled = false;
        symbol = "❯";
        format = "[$symbol]($style)";
        repeat = true;
        repeat_offset = 1;
      };

      character = {
        format = "$symbol ";
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        vimcmd_symbol = "[❮](bold green)";
        vimcmd_replace_one_symbol = "[❮](bold orange)";
        vimcmd_replace_symbol = "[❮](bold orange)";
        vimcmd_visual_symbol = "[❮](bold purple)";
      };
    };
  };
}

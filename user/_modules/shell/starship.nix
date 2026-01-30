{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$sudo"
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
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
        "$aws"
        "$gcloud"
        "$azure"

        "$cmd_duration"

        "$line_break"

        "$jobs"
        "$battery"
        "$status"
        "$container"
        "$character"
      ];

      # left side segments - core

      sudo = {
        disabled = false;
        symbol = " ";
        format = "[$symbol]($style)";
        style = "bold yellow";
      };

      username = {
        show_always = true;
        format = "[$user]($style) [|](bright-black) ";
      };
      
      hostname = {
        ssh_only = false;
        ssh_symbol = " ";
        format = "[$ssh_symbol$hostname]($style) [|](bright-black) ";
        style = "bold green";
      };
      
      directory = {
        format = "[$read_only]($read_only_style)[$path]($style) ";
        read_only = "󰌾 ";
        style = "bold blue";
        truncate_to_repo = false;
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      
      # left side segments - dev / container

      git_branch = {
        symbol = " ";
      };
      
      git_commit = {
        tag_symbol = "  ";
      };
      
      git_state = {
      };
      
      git_metrics = {
      };
      
      git_status = {
      };
      
      docker_context = {
        symbol = " ";
        format = "[$symbol$context]($style) [|](bright-black) ";
      };
      
      package = {
        symbol = "󰏗 ";
        format = "(is [$symbol$version]($style) )";
      };
      
      # fill

      fill = {
        style = "bright-black";
      };

      # right side segments - languages

      c = {
        symbol = "C ";
        format = "([$symbol($version(-$name))]($style) [|](bright-black)) ";
      };
      
      cpp = {
        symbol = "C++ ";
        format = "([$symbol($version(-$name))]($style) [|](bright-black)) ";
      };

      cmake = {
        symbol = "cmake ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      golang = {
        symbol = "go ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      java = {
        symbol = "java ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      lua = {
        symbol = "lua ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      nodejs = {
        symbol = "nodejs ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      perl = {
        symbol = "pl ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      python = {
        symbol = "py ";
        format = "([\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style)[|](bright-black)) ";
      };

      ruby = {
        symbol = "rb ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      rust = {
        symbol = "rs ";
        format = "([$symbol($version)]($style) [|](bright-black)) ";
      };

      # right side segments - os / cloud

      nix_shell = {
        symbol = " ";
        format = "[$symbol$state( \($name\))]($style) [|](bright-black) ";
      };

      aws = {
        symbol = "aws ";
        format = "[$symbol($profile )(\($region\) )(\[$duration\] )]($style) [|](bright-black) ";
      };

      gcloud = {
        symbol = "gcp ";
        format = "[$symbol$account(@$domain)(\($region\))]($style) [|](bright-black) ";
      };

      azure = {
        symbol = "azr ";
        format = "on [$symbol($subscription)]($style) [|](bright-black) ";
      };

      # command duration

      cmd_duration = {
        format = "󱎫 [$duration]($style)";
        style = "white";
      };

      # command line segments

      jobs = {
      };

      battery = {
      };

      status = {
        symbol = " ";
        disabled = false;
      };

      container = {
      };

      character = {
      };
    };
  };
}
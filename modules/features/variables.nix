{
  features.variables = {
    nixos = {
      environment.variables = {
        # add system-level variables here
      };
    };

    homeManager = {
      home.sessionVariables = {
        BROWSER = "google-chrome";
        EDITOR = "nvim";
        VISUAL = "nvim";
        TERMINAL = "foot";

        NEWT_COLORS = ''
          root=black,black
          border=lightgray,black
          window=lightgray,black
          shadow=black,black
          title=yellow,black
          button=black,blue
          actbutton=blue,white
          compactbutton=lightgray,black
          checkbox=lightgray,black
          actcheckbox=black,lightgray
          entry=lightgray,black
          disentry=black,gray
          label=white,black
          listbox=lightgray,black
          actlistbox=blue,black
          sellistbox=black,blue
          actsellistbox=black,blue
          textbox=white,black
          acttextbox=blue,black
          emptyscale=,gray
          fullscale=,blue
          helpline=black,white
          roottext=black,lightgrey
        '';
      };
    };
  };
}

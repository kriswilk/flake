{ config, lib, pkgs, ... }:

{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.printing = {
    enable = true;
    browsed.enable = false; # DO NOT auto-configure printers!
    drivers = with pkgs; [
      brgenml1lpr
      brgenml1cupswrapper
      canon-cups-ufr2
    ];
  };

  # WIP: need better naming scheme for printers
  # WIP: customize printer features (eg., duplex?)
  hardware.printers.ensurePrinters = [
    {
      name = "fathoms-daniela";
      description = "Brother DCP-7065DN";
      location = "fathoms";
      deviceUri = "socket://10.0.0.203";
      model = "brother-BrGenML1-cups-en.ppd";
      ppdOptions = {
        PageSize = "Letter";
      };
    }
    {
      name = "fathoms-kris";
      description = "Canon MF455dw";
      location = "fathoms";
      deviceUri = "socket://10.0.0.216";
      model = "CNRCUPSMF450ZS.ppd";
      # ppdOptions = {
      #   PageSize = "Letter";
      #   Option1 = "True"; # duplexer
      # };
    }
    {
      name = "fathoms-office";
      description = "Canon MF455dw";
      location = "fathoms";
      deviceUri = "socket://10.0.0.215";
      model = "CNRCUPSMF450ZS.ppd";
      # ppdOptions = {
      #   PageSize = "Letter";
      #   Option1 = "True"; # duplexer
      # };
    }
    {
      name = "fathoms-thermal";
      description = "Zebra ZT230";
      location = "fathoms";
      deviceUri = "socket://10.0.0.214";
      model = "drv:///sample.drv/zebra.ppd";
      ppdOptions = {
        PageSize = "w288h432"; # 4in x 6in
      };
    }
    # -----------------------------------------------------
    {
      name        = "reefnet-office";
      description = "Brother MFC-7460DN";
      location    = "reefnet";
      deviceUri   = "socket://192.168.1.201";
      model       = "brother-BrGenML1-cups-en.ppd";
      ppdOptions  = {
        PageSize = "Letter";
      };
    }
    {
      name        = "reefnet-colour";
      description = "Lexmark C3224dw";
      location    = "reefnet";
      deviceUri   = "socket://192.168.1.202";
      model       = "drv:///sample.drv/generpcl.ppd";
      ppdOptions  = {
        PageSize = "Letter";
      };
    }
    {
      name        = "reefnet-thermal";
      description = "Zebra ZT230";
      location    = "reefnet";
      deviceUri   = "socket://192.168.1.212";
      model       = "drv:///sample.drv/zebra.ppd";
      ppdOptions  = {
        PageSize = "w288h432"; # 4in x 6in
      };
    }
  ];
}
{
  features.core_environment = {
    nixos = {
      environment.variables = {
        # add system-level variables here
      };
    };

    homeManager = {
      home.sessionVariables = {
        # add user-level variables here
      };
    };
  };
}

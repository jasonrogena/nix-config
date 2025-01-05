{ config, pkgs, ... }:

{
  system.stateVersion = "24.11";
  containers.home-assistant = {
    autoStart = true;
    config = { config, pkgs, lib, ... }: {
      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 8123 ];
        };
        useHostResolvConf = lib.mkForce false;
      };

      services.home-assistant = {
        enable = true;
        extraComponents = [];
        config = {
          default_config = {};
        };
      };

      services.resolved.enable = true;
    };

  
  };
}

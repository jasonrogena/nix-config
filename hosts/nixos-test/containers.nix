{ config, pkgs, ... }:
{
  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "ens3";
    enableIPv6 = true;
  };

  imports = [
    ../../modules/containers/home-assistant
  ];
  containers.home-assistant = {
    privateNetwork = true;
    hostAddress = "192.168.10.1";
    localAddress = "192.168.10.11";
    hostAddress6 = "fc00::1";
    localAddress6 = "fc00::2";
  };
}

{ pkgs, ... }:

{
	virtualisation = {
		docker.enable = true;

		libvirtd = {
				enable = true;
				qemu.runAsRoot = false;
		};
	};

    environment.systemPackages = with pkgs; [
		docker
		docker-compose
		lazydocker
		virt-manager
	];

	systemd.services.docker.wantedBy = [ ];
}

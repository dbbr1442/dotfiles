{ config, pkgs, inputs, ... }:
{
	boot.kernelParams = [ "intel_iommu=on" ];

    environment.systemPackages = with pkgs; [
        qemu
        virt-manager
        vde2
        ebtables
        iptables
        nftables
        dnsmasq
        bridge-utils
        OVMF
        qemu-utils
        qemu_kvm
        libvirt
    ];  

    virtualisation.libvirtd.extraConfig = ''
        unix_sock_groups = "libvirt"
        unix_sock_rw_perms = "0770"


        log_filters="3:qemu 1:libvirt"
        log_outputs="2:file:/var/log/libvirt/libvirtd.log"
    '';
    virtualisation.libvirtd.enable = true;

    virtualisation.libvirtd.qemu = {
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
        runAsRoot = false;
    };

    users.users.lucy.extraGroups = [ "kvm" "libvirt" ];
    
    
}

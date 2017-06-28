## PXEServe
A Docker image with a complete, self-contained PXE solution with a DHCP Proxy to overlay your existing network with near-zero conf.

This is a complete PXE server that can host linux kernels and ramdisks from the internet, your local disk, or other PXE boot configurations
using a docker container and whatever configuration file you want to construct.

## Example Usage

    # on the machine that will host the PXE server (same network as the machine to boot PXE but not same machine!)

    git clone https://github.com/gearmover/pxeserve

    # edit config file at cfg/

    vim cfg/dnsmasq.conf

        # change the IP address to the subnet your host machine is on
        dhcp-range=___.___.___.255,proxy

        # change the IP address to the exact IP address of the host machine
        dhcp-boot=http://___.___.___.___:5000/pxelinux.0

    # edit the PXE configuration at pxelinux.cfg/

    vim pxelinux.cfg/default

        # you can read the examples I've included as well as search Google for other ways of PXE booting
        label MiscISO
            menu label Random ISO Disk
            root (hd0,0)
            kernel syslinux/memdisk
            append iso initrd=some_iso.iso raw

    make build
    make run

The PXE server docker container uses the host network of the machine which is running the Docker container.  It runs dnsmasq in
DHCP proxy mode, meaning it picks up on the host network DHCP (it's not distributing IP addresses) and 'amends' that there is a PXE server running on that machine.

## Example Configuration Menu Label for a Miscellanious ISO to PXE boot

    label MiscISO
        menu label Random ISO Disk
        root (hd0,0)
        kernel syslinux/memdisk
        append iso initrd=some_iso.iso raw

Credit To https://wellsie.net/p/286/ for this tidbit.  Also would need to add the ISO to the Docker container (check the Dockerfile).

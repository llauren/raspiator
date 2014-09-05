# The Raspiator Project

At our work, a *Radiator* is an information or status display, showing how the
servers or integrations are doing, or basically any other stat. You've seen
status displays in the movies. These are ours. 

A *Raspiator* is a Radiator built on a Raspberry Pi, running the
[Raspbian](http://www.raspbian.org) image with customisations from the
[Watershed display
project](http://blogs.wcode.org/2013/09/howto-boot-your-raspberry-pi-into-a-fullscreen-browser-kiosk/).
I'll integrate those bits here eventually. I've also had inspiration from the
[Screenly](https://github.com/wireload/screenly-ose) project.

This repo exists so that i can compile the stuff needed to run it all. There's
nothing very fancy here yet. In fact, there is only a little script to turn the
screensaver on and off on a schedule, but eventually i hope to add even fancy
[Ansible](https://github.com/ansible) management things to the server side. 

So all in all, nothing here to be excited about. Yet. 

## Getting started

Install **Ansible** on your workstation (using Homebrew or pip, or whatever means
you fancy). Burn a norman Raspbian installation on an SD card. Jump through the normal 
first-boot hoops. Give maximum space for the graphics. Give the Raspi a hostname. 
Depending on your network, you may need to add the hostname to your DHCP leases.

When all that's done and the Rasppi is rebooted, on your machine, run the script 
`init-raspiator.sh _hostname_` where _hostname_ is what you named your host in the 
section above. This'll create an ssh key pair and distribute the public part to the
Raspi. 

Now edit your Ansible hosts file and add the new host to both the section [init-radiators] 
and [radiators]. Create a file host_vars/_hostname_ (with _hostname_ again as above)
with three dashes on the first line and the line `url: http://some.host/some.html` to
point what you want on your Radiator screen.

Run `ansible-playbook init-raspiator.yml` and watch the magic happen.

To change the screen afterwards, edit the host_vars/_hostname_ file, then run 
`ansible-playbook local.yml` (the file name will change eventually).

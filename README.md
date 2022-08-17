Okay so I'm starting over with this project.

My main goals in self-hosting are:
1. In case of internet outage, service within the home LAN must still be available. Doesn't need to be HA, but it needs to work.
2. Quick deploy and recovery. If there's a total service loss, I should be able to redeploy on whatever machine(s) I have handy.
3. Make certain services accessible to the world through a domain name.
4. Email, filecloud/collaboration, groupware (calendar/tasks)

BASIC STRUCTURE
bastion with boringproxy and fail2ban/crowdsec
behind home NAT, the main hosting server tunneling to boringproxy
caddy RP adds and removes TLS
nextcloud and whoami are services to be provided

Current plan:
once i have a home gateway that allows the DNS server to be changed, dnsmasq so NAT loopback works right (currently taking the long route)
no clever GUI tools this time, so I'll need to set up Promethus (or something) for observability and pretty plots
also: backups and the "can i spin this repo up on some rando cloud server" test

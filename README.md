Okay so I'm starting over with this project.

My main goals in self-hosting are:
1. In case of internet outage, service within the home LAN must still be available. Doesn't need to be HA, but it needs to work.
2. Quick deploy and recovery. If there's a total service loss, I should be able to redeploy on whatever machine(s) I have handy.
3. Make certain services accessible to the world through a domain name.
4. Email, filecloud/collaboration, groupware (calendar/tasks)

BASIC STRUCTURE
bastion with boringproxy
TODO: and fail2ban/crowdsec
caddy RP adds and removes TLS
behind home NAT, the main hosting server provides local service via caddy
docker container tunnels to boringproxy
unbound on internal server providing view-based splitbrain DNS to local clients
TODO: docspell
TODO: monitoring
TODO: bring all compose files up to modern standards
TODO: startup script for stuff like making the initial networks manually

no clever GUI tools this time, so I'll need to set up Promethus (or something) for observability and pretty plots
also: backups and the "can i spin this repo up on some rando cloud server" test

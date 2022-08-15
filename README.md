Okay so I'm starting over with this project.

My main goals in self-hosting are:
1. In case of internet outage, service within the home LAN must still be available. Doesn't need to be HA, but it needs to work.
2. Quick deploy and recovery. If there's a total service loss, I should be able to redeploy on whatever machine(s) I have handy.
3. Make certain services accessible to the world through a domain name.
4. Email, filecloud/collaboration, groupware (calendar/tasks)

Current plan:
Caddy as reverse proxy for ingress/SSL
Nextcloud for groupware/identity provider
dnsmasq so NAT loopback works right
rig up the real domain to Caddy for proper SSL
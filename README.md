Okay so I'm starting over with this project.

My main goals in self-hosting are:
1. In case of internet outage, service within the home LAN must still be available. Doesn't need to be HA, but it needs to work.
2. Quick deploy and recovery. If there's a total service loss, I should be able to redeploy on whatever machine(s) I have handy.
3. Make certain services accessible to the world through a domain name.
4. Email, filecloud/collaboration, groupware (calendar/tasks)

Current plan:
Caddy as reverse proxy for ingress/SSL
Nextcloud for groupware/identity provider
bought the domain already
rig up the real domain to Caddy for proper SSL
dnsmasq so NAT loopback works right once i have a home gateway that allows the DNS server to be changed
fail2ban or crowdsec to harden
no clever GUI tools this time, so I'll need to set up Promethus (or something) for observability and pretty plots
also: backups and the "can i spin this repo up on some rando cloud server" test

TODO: remove hardcoded passwords and get .env 'secrets' working before exposing to internet

Note: because there are no subdomains in mDNS, applications live in various directories of webroot. This can cause URL issues.
Nextcloud needed to be manually told the webroot with overwritewebroot and overwrite.cli.root in the ncconfig volume
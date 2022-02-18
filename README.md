HOW TO SET UP A NODE

1. obv do the whole docker swarm init thing
2. you gotta install docker-ingress-routing-daemon on all your worker nodes. note that you can't use docker for this since root, so i guess you've finally discovered why people love ansible 

narrative:

My main goals in self-hosting are:
1. In case of internet outage, service within the home LAN must failover. It doesn't need to be HA, but it needs to work.
2. Resilient. If there's a total service loss, I should be able to deploy on whatever machine(s) I have handy.
3. Make certain services accessible to the world through a domain name.
4. Fortify the fuck out of the public face. Crowdsec, effectively-uncrackable webauthn, SSO to not do it more than once, and a big red button to intentionally scuttle networking with the internet.
5. Email, filecloud/collaboration, groupware (calendar/tasks)

It came to me in a flash while experimenting with yet another docker-compose.yaml and glancing at the spec's deploy options.  And I returned to it after suffering the countless indignations of Kubernetes.

Everything had suggested using a single node Docker Swarm cluster for its orchestration capabilities (health checks, etc). But if I used a *second* node visible to the public internet, and connected them via a magic VPN like zerotier, then I could push services from my desktop node to the cloud VPS and have it act as a sort of weird bastion server. No matter which node a service used, the routing mesh would make sure it goes to the right place, and with my RPi i could make a 3rd manager-only node at home that would allow the cluster to just keep chugging.

THE PLAN:
caddy to lldap
caddy to authelia to lldap
get a flow going to netdata
add the new node
finally work out shared persistence, as funny as it would be global syncthing /var/lib/docker/volumes probably isn't a good idea

Notes on setting up Caddy:
During development, set `caddy.tls: "internal"` to use self-signed certificates instead of spamming Let's Encrypt.

We need both the caddy-docker-proxy and caddy-security plugins to have Caddy run double-duty. Authelia 

When deploying a stack, Docker Swarm adds the stack name as a prefix to all the resources named in the docker-compose.yaml. Keep your folder organization neat to help keep track of this--always launch a stack with the same name as its folder, or references may break. Anything with `external: true` will need the stack prefix included to function correctly.
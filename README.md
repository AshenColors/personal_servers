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
- caddy to lldap
- caddy to ~~authelia~~ caddy, *again*, to lldap
- get an authorization flow going to a netdata deploy
- add the new node
- finally work out shared persistence (as funny as it would be global `syncthing /var/lib/docker/volumes` probably isn't a good idea)

Notes on setting up Caddy:

We just ended up using traefik lmao

Other notes:

When deploying a stack, Docker Swarm adds the stack name as a prefix to all the resources named in the docker-compose.yaml. Keep your folder organization neat to help keep track of this--always launch a stack with the same name as its folder, or references may break. Anything with `external: true` will need the stack prefix included to function correctly.

Docker compose/stacks deploy now supports multiple files. You can put your production changes in a second `docker-compose.prod.yaml` with overrides like Kustomizer does. This will be perfect to change things over to the live domain when you're ready to deploy For Real. You'll also have to set `caddy.tls` to your email to get Let's Encrypt certificates issued.
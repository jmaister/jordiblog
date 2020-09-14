---
title: "Reverse proxy with Caddy 2"
date: "2020-04-13"
---

This is the first post about self hosted services. In a attempt to get rid if giving my private 
data to big companies.

All these services will be hosted in a Virtual Private Server (VPS). With a domain that I bought 
to point to its IP address.

Every service will be served from a different port, and instead of knowking these port numbers, 
the reverse proxy will translate a each subdomain to its specific port:

* example.com -> port 80
* www.example.com -> port 80
* chat.example.com -> port 1313
* nextcloud.example.com -> port 55055
* etc...

# Reverse proxy selection

I am using Caddy 2 as a reverse proxy. [Caddy server web](https://caddyserver.com/).

Before Caddy, I was using nginx as a reverse proxy. I find that Caddy is easier to install and 
configure.

Also, Caddy automatically handles the request and renewal of SSL certificates with Let's Encrypt. 
It is meant to make every request secure.

# Caddy installation

Follow the instructions for [install Caddy 
2](https://caddyserver.com/docs/install#manually-installing-as-a-linux-service) here.

Allow an executable to open ports below 1024:

    sudo setcap cap_net_bind_service=+ep ./caddy

Here is the sample systemd configuration file to start Caddy when the machine is started: 
[caddy.service](https://github.com/caddyserver/dist/blob/master/init/caddy.service)

# Caddy configuration


This is the configuration file stored on /etc/caddy/Caddyfile


    {
        # email to use on Let's Encrypt
        email jordiburgos@example.com
        
        # Uncomment for debug
        #acme_ca https://acme-staging-v02.api.letsencrypt.org/directory
        #debug
    }

    # Add gzip compression to requests
    (webconf) {
      encode gzip
    }

    # Add forward headers to requests
    (theheaders) {
        header_up X-Forwarded-Ssl on
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-For {remote}
        header_up X-Forwarded-Port {server_port}
        header_up X-Forwarded-Proto {scheme}
        header_up X-Url-Scheme {scheme}
        header_up X-Forwarded-Host {host}
    }

    example.com, www.example.com {
        root * /var/www/example.com/
        file_server
        import webconf
    }

    jenkins.example.com {
        reverse_proxy http://127.0.0.1:9080 {
          import theheaders
        }
        import webconf
    }

    nextcloud.example.com {
        reverse_proxy http://127.0.0.1:60080 {
         #import theheaders
        }
        import webconf
    }


    chat.example.com {
        reverse_proxy http://127.0.0.1:3000 {
         import theheaders
        }
        import webconf
    }


Mostly every subdomain has the same configuration. The only difference is the port number where you deployed each service.

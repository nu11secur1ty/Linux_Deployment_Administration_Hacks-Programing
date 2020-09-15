# Delete Certbot Certificate by Domain Name

`Reader Tim Thorp kindly provided a more immediate way to delete a Certbot certificate by including the domain name in the command like this:`

```bash
certbot delete --cert-name example.com
./certbot-auto delete --cert-name example.com
./letsencrypt-auto delete --cert-name domain.example.com
```
- - - help
```bash
usage: 
  letsencrypt [SUBCOMMAND] [options] [-d domain] [-d domain] ...

The Let's Encrypt agent can obtain and install HTTPS/TLS/SSL certificates.  By
default, it will attempt to use a webserver both for obtaining and installing
the cert. Major SUBCOMMANDS are:

  (default) run        Obtain & install a cert in your current webserver
  certonly             Obtain cert, but do not install it (aka "auth")
  install              Install a previously obtained cert in a server
  revoke               Revoke a previously obtained certificate
  rollback             Rollback server configuration changes made during install
  config_changes       Show changes made to server config during installation
  plugins              Display information about installed plugins

optional arguments:
  -h, --help            show this help message and exit
  -c CONFIG_FILE, --config CONFIG_FILE
                        config file path (default: None)
  -v, --verbose         This flag can be used multiple times to incrementally
                        increase the verbosity of output, e.g. -vvv. (default:
                        -3)
  -t, --text            Use the text output instead of the curses UI.
                        (default: False)
  --register-unsafely-without-email
                        Specifying this flag enables registering an account
                        with no email address. This is strongly discouraged,
                        because in the event of key loss or account compromise
                        you will irrevocably lose access to your account. You
                        will also be unable to receive notice about impending
                        expiration or revocation of your certificates. Updates
                        to the Subscriber Agreement will still affect you, and
                        will be effective 14 days after posting an update to
                        the web site. (default: False)
  -m EMAIL, --email EMAIL
                        Email used for registration and recovery contact.
                        (default: None)
  -d DOMAIN, --domains DOMAIN, --domain DOMAIN
                        Domain names to apply. For multiple domains you can
                        use multiple -d flags or enter a comma separated list
                        of domains as a parameter. (default: [])
  --user-agent USER_AGENT
                        Set a custom user agent string for the client. User
                        agent strings allow the CA to collect high level
                        statistics about success rates by OS and plugin. If
                        you wish to hide your server OS version from the Let's
                        Encrypt server, set this to "". (default: None)

automation:
  Arguments for automating execution & other tweaks

  --keep-until-expiring, --keep, --reinstall
                        If the requested cert matches an existing cert, always
                        keep the existing one until it is due for renewal (for
                        the 'run' subcommand this means reinstall the existing
                        cert) (default: False)
  --expand              If an existing cert covers some subset of the
                        requested names, always expand and replace it with the
                        additional names. (default: False)
  --version             show program's version number and exit
  --renew-by-default    Select renewal by default when domains are a superset
                        of a previously attained cert (often --keep-until-
                        expiring is more appropriate). Implies --expand.
                        (default: False)
  --agree-tos           Agree to the Let's Encrypt Subscriber Agreement
                        (default: False)
  --account ACCOUNT_ID  Account ID to use (default: None)
  --duplicate           Allow making a certificate lineage that duplicates an
                        existing one (both can be renewed in parallel)
                        (default: False)

testing:
  The following flags are meant for testing purposes only! Do NOT change
  them, unless you really know what you're doing!

  --debug               Show tracebacks in case of errors, and allow
                        letsencrypt-auto execution on experimental platforms
                        (default: False)
  --no-verify-ssl       Disable SSL certificate verification. (default: False)
  --tls-sni-01-port TLS_SNI_01_PORT
                        Port number to perform tls-sni-01 challenge. Boulder
                        in testing mode defaults to 5001. (default: 443)
  --http-01-port HTTP01_PORT
                        Port used in the SimpleHttp challenge. (default: 80)
  --break-my-certs      Be willing to replace or renew valid certs with
                        invalid (testing/staging) certs (default: False)
  --test-cert, --staging
                        Use the staging server to obtain test (invalid) certs;
                        equivalent to --server https://acme-
                        staging.api.letsencrypt.org/directory (default: False)

security:
  Security parameters & server settings

  --rsa-key-size N      Size of the RSA key. (default: 2048)
  --redirect            Automatically redirect all HTTP traffic to HTTPS for
                        the newly authenticated vhost. (default: None)
  --no-redirect         Do not automatically redirect all HTTP traffic to
                        HTTPS for the newly authenticated vhost. (default:
                        None)
  --hsts                Add the Strict-Transport-Security header to every HTTP
                        response. Forcing browser to use always use SSL for
                        the domain. Defends against SSL Stripping. (default:
                        False)
  --no-hsts             Do not automatically add the Strict-Transport-Security
                        header to every HTTP response. (default: False)
  --uir                 Add the "Content-Security-Policy: upgrade-insecure-
                        requests" header to every HTTP response. Forcing the
                        browser to use https:// for every http:// resource.
                        (default: None)
  --no-uir              Do not automatically set the "Content-Security-Policy:
                        upgrade-insecure-requests" header to every HTTP
                        response. (default: None)
  --strict-permissions  Require that all configuration files are owned by the
                        current user; only needed if your config is somewhere
                        unsafe like /tmp/ (default: False)

certonly:
  Options for modifying how a cert is obtained

  --csr CSR             Path to a Certificate Signing Request (CSR) in DER
                        format; note that the .csr file *must* contain a
                        Subject Alternative Name field for each domain you
                        want certified. (default: None)

install:
  Options for modifying how a cert is deployed

revoke:
  Options for revocation of certs

rollback:
  Options for reverting config changes

  --checkpoints N       Revert configuration N number of checkpoints.
                        (default: 1)

plugins:
  Plugin options

  --init                Initialize plugins. (default: False)
  --prepare             Initialize and prepare plugins. (default: False)
  --authenticators      Limit to authenticator plugins only. (default: None)
  --installers          Limit to installer plugins only. (default: None)

paths:
  Arguments changing execution paths & servers

  --cert-path CERT_PATH
                        Path to where cert is saved (with auth --csr),
                        installed from or revoked. (default: None)
  --key-path KEY_PATH   Path to private key for cert installation or
                        revocation (if account key is missing) (default: None)
  --fullchain-path FULLCHAIN_PATH
                        Accompanying path to a full certificate chain (cert
                        plus chain). (default: None)
  --chain-path CHAIN_PATH
                        Accompanying path to a certificate chain. (default:
                        None)
  --config-dir CONFIG_DIR
                        Configuration directory. (default: /etc/letsencrypt)
  --work-dir WORK_DIR   Working directory. (default: /var/lib/letsencrypt)
  --logs-dir LOGS_DIR   Logs directory. (default: /var/log/letsencrypt)
  --server SERVER       ACME Directory Resource URI. (default:
                        https://acme-v01.api.letsencrypt.org/directory)

plugins:
  Let's Encrypt client supports an extensible plugins architecture. See
  'letsencrypt plugins' for a list of all installed plugins and their names.
  You can force a particular plugin by setting options provided below.
  Further down this help message you will find plugin-specific options
  (prefixed by --{plugin_name}).

  -a AUTHENTICATOR, --authenticator AUTHENTICATOR
                        Authenticator plugin name. (default: None)
  -i INSTALLER, --installer INSTALLER
                        Installer plugin name (also used to find domains).
                        (default: None)
  --configurator CONFIGURATOR
                        Name of the plugin that is both an authenticator and
                        an installer. Should not be used together with
                        --authenticator or --installer. (default: None)
  --apache              Obtain and install certs using Apache (default: False)
  --nginx               Obtain and install certs using Nginx (default: False)
  --standalone          Obtain certs using a "standalone" webserver. (default:
                        False)
  --manual              Provide laborious manual instructions for obtaining a
                        cert (default: False)
  --webroot             Obtain certs by placing files in a webroot directory.
                        (default: False)

apache:
  Apache Web Server - Alpha

  --apache-ctl APACHE_CTL
                        Path to the 'apache2ctl' binary, used for
                        'configtest', retrieving the Apache2 version number,
                        and initialization parameters. (default: apache2ctl)
  --apache-enmod APACHE_ENMOD
                        Path to the Apache 'a2enmod' binary. (default:
                        a2enmod)
  --apache-dismod APACHE_DISMOD
                        Path to the Apache 'a2dismod' binary. (default:
                        a2dismod)
  --apache-le-vhost-ext APACHE_LE_VHOST_EXT
                        SSL vhost configuration extension. (default: -le-
                        ssl.conf)
  --apache-server-root APACHE_SERVER_ROOT
                        Apache server root directory. (default: /etc/apache2)

webroot:
  Webroot Authenticator

  -w WEBROOT_PATH, --webroot-path WEBROOT_PATH
                        public_html / webroot path. This can be specified
                        multiple times to handle different domains; each
                        domain will have the webroot path that preceded it.
                        For instance: `-w /var/www/example -d example.com -d
                        www.example.com -w /var/www/thing -d thing.net -d
                        m.thing.net` (default: None)

null:
  Null Installer

manual:
  Manually configure an HTTP server

  --manual-test-mode    Test mode. Executes the manual command in subprocess.
                        (default: False)
  --manual-public-ip-logging-ok
                        Automatically allows public IP logging. (default:
                        False)

standalone:
  Automatically use a temporary webserver

  --standalone-supported-challenges STANDALONE_SUPPORTED_CHALLENGES
                        Supported challenges. Preferred in the order they are
                        listed. (default: tls-sni-01,http-01)
```

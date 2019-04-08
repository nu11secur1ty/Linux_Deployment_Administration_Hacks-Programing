modperl:~ # apachectl -M
[Mon Apr 08 13:39:24.626156 2019] [so:warn] [pid 86703] AH01574: module alias_module is already loaded, skipping
[Mon Apr 08 13:39:24.626229 2019] [so:warn] [pid 86703] AH01574: module cgi_module is already loaded, skipping
[Mon Apr 08 13:39:24.626243 2019] [so:warn] [pid 86703] AH01574: module cgi_module is already loaded, skipping
Loaded Modules:
 core_module (static)
 so_module (static)
 http_module (static)
 mpm_prefork_module (static)
 unixd_module (static)
 systemd_module (static)
 actions_module (shared)
 alias_module (shared)
 auth_basic_module (shared)
 authn_core_module (shared)
 authn_file_module (shared)
 authz_host_module (shared)
 authz_groupfile_module (shared)
 authz_core_module (shared)
 authz_user_module (shared)
 autoindex_module (shared)
 cgi_module (shared)
 dir_module (shared)
 env_module (shared)
 expires_module (shared)
 include_module (shared)
 log_config_module (shared)
 mime_module (shared)
 negotiation_module (shared)
 setenvif_module (shared)
 ssl_module (shared)
 socache_shmcb_module (shared)
 userdir_module (shared)
 reqtimeout_module (shared)
 perl_module (shared)
 info_module (shared)
 status_module (shared)
modperl:~ # apachectl -M | grep prefork
[Mon Apr 08 13:39:30.596382 2019] [so:warn] [pid 86713] AH01574: module alias_module is already loaded, skipping
[Mon Apr 08 13:39:30.596454 2019] [so:warn] [pid 86713] AH01574: module cgi_module is already loaded, skipping
[Mon Apr 08 13:39:30.596464 2019] [so:warn] [pid 86713] AH01574: module cgi_module is already loaded, skipping
 mpm_prefork_module (static)
modperl:~ # 

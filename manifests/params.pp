class google_auth_proxy::params {
  $user             = 'root'
  $group            = 'root'
  $version          = "1.1.1"
  $install_base_dir = '/opt'
  $install_dir      = "google_auth_proxy-${version}.linux-amd64.go1.4.2"
  $install_path     = "${install_base_dir}/${install_dir}"
  $install_dir_link = "${install_base_dir}/google_auth_proxy"
  $binary_path      = "${install_dir_link}/google_auth_proxy"
  $config_path      = "${install_path}/google_auth_proxy.cfg"
  $filename         = "google_auth_proxy-${version}.linux-amd64.go1.4.2.tar.gz"
  $download_url     = "https://github.com/bitly/google_auth_proxy/releases/download/v${version}/${filename}"

  $upstreams           = hiera('google_auth_upstreams', ['http://127.0.0.1:8080'])
  $google_apps_domains = hiera('google_apps_domains', [])
  $http_address        = hiera('google_auth_proxy_http_address', '127.0.0.1:4180')
  $htpasswd_file       = hiera('google_auth_proxy_htpasswd_file', '')
  $auth_emails_file    = hiera('google_auth_emails_file', '')
  $cookie_secret       = hiera('google_auth_cookie_secret', undef)

  $service_ensure  = hiera('google_auth_service_ensure', 'present')
  $service_enabled = hiera('google_auth_service_enabled', true)
}

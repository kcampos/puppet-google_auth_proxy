class google_auth_proxy::params {
  $user             = 'root'
  $group            = 'root'
  $version          = "1.1.1"
  $install_base_dir = '/opt'
  $install_dir      = "google_auth_proxy-${version}.linux-amd64.go1.4.2"
  $install_path     = "${install_base_dir}/${install_dir}"
  $install_dir_link = "${install_base_dir}/google_auth_proxy"
  $filename         = "google_auth_proxy-${version}.linux-amd64.go1.4.2.tar.gz"
  $download_url     = "https://github.com/bitly/google_auth_proxy/releases/download/v${version}/${filename}"

  $google_apps_domains = hiera('google_apps_domains', [])
  $http_address        = hiera('google_auth_proxy_http_address', '127.0.0.1:4180')
  $htpasswd_file       = hiera('oogle_auth_proxy_htpasswd_file', '')
}

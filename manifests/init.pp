class google_auth_proxy(
  $client_id,
  $client_secret,
  $user      = $google_auth_proxy::params::user,
  $group     = $google_auth_proxy::params::group,
  $version   = $google_auth_proxy::params::version
) inherits google_auth_proxy::params {

  File { owner => $user, group => $group }

  archive { $install_dir:
    url              => $download_url,
    target           => $install_base_dir,
    follow_redirects => true,
    checksum         => false
  }

  file { $install_path:
    ensure  => directory,
    mode    => '0755',
    require => Archive[$install_dir]
  }

  file { $install_dir_link:
    ensure  => link,
    target  => $install_path,
    require => File[$install_path]
  }

  file { "${install_path}/google_auth_proxy.cfg":
    ensure  => file,
    mode    => '0600',
    content => template('google_auth_proxy/google_auth_proxy.cfg.erb'),
    require => File[$install_path]
  }
}

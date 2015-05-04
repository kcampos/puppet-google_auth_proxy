class google_auth_proxy::service () inherits google_auth_proxy::params {
  supervisor::program { 'google_auth_proxy':
    ensure      => $service_ensure,
    enable      => str2bool($service_enabled),
    command     => "${binary_path} -config ${config_path}",
    startsecs   => '5',
    stdout_logfile_maxsize => '10MB',
    stdout_logfile_backups => '5',
    stderr_logfile_maxsize => '10MB',
    stderr_logfile_backups => '5',
    user        => 'root',
    group       => 'root'
  }
}

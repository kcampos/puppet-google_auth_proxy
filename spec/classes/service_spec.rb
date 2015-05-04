require 'spec_helper'

describe 'google_auth_proxy::service' do
  it { should contain_supervisor__program('google_auth_proxy').with({
    'ensure'      => 'present',
    'enable'      => 'true',
    'command'     => "/opt/google_auth_proxy/google_auth_proxy -config /opt/google_auth_proxy-1.1.1.linux-amd64.go1.4.2/google_auth_proxy.cfg",
    'startsecs'   => '5',
    'stdout_logfile_maxsize' => '10MB',
    'stdout_logfile_backups' => '5',
    'stderr_logfile_maxsize' => '10MB',
    'stderr_logfile_backups' => '5',
    'user'        => 'root',
    'group'       => 'root'
    })
  }
end

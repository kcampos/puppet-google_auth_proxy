require 'spec_helper'

describe 'google_auth_proxy' do
  let(:client_id) { "google_auth_id" }
  let(:client_secret) { "google_auth_secret" }
  let(:user) { "test_user" }
  let(:group) { "test_group" }
  let(:version) { "1.1.1" }

  let(:params) { {:client_id => client_id, :client_secret => client_secret, :user => user, :group => group, :version => version} }
  
  it { should contain_archive("google_auth_proxy-#{version}.linux-amd64.go1.4.2").with({
    'url'              => "https://github.com/bitly/google_auth_proxy/releases/download/v#{version}/google_auth_proxy-#{version}.linux-amd64.go1.4.2.tar.gz",
    'target'           => '/opt',
    'follow_redirects' => true,
    'checksum'         => false
    })
  }

  it { should contain_file("/opt/google_auth_proxy-#{version}.linux-amd64.go1.4.2").with({
    'ensure'  => 'directory',
    'mode'    => '0755',
    }).that_requires("Archive[google_auth_proxy-#{version}.linux-amd64.go1.4.2]")
  }

  it { should contain_file('/opt/google_auth_proxy').with({
    'ensure'  => 'link',
    'target'  => "/opt/google_auth_proxy-#{version}.linux-amd64.go1.4.2"
    }).that_requires("File[/opt/google_auth_proxy-#{version}.linux-amd64.go1.4.2]")
  }

  it { should contain_file("/opt/google_auth_proxy-#{version}.linux-amd64.go1.4.2/google_auth_proxy.cfg").with({
    'owner'   => user,
    'group'   => group,
    'ensure'  => 'file',
    'content' => /client_id = "#{client_id}"\nclient_secret = "#{client_secret}"/,
    'mode'    => '0600'
    }).that_requires("File[/opt/google_auth_proxy-#{version}.linux-amd64.go1.4.2]")
  }
end

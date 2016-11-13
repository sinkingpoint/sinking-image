package{ 'unzip':
  ensure => 'installed'
}

package{ 'zip':
  ensure => 'installed'
}

package{ 'awscli':
  ensure => 'installed'
}

remote_file { '/tmp/vault.zip':
  ensure => present,
  source => 'https://releases.hashicorp.com/vault/0.6.2/vault_0.6.2_linux_amd64.zip',
}

exec { 'unzip':
  command     => 'sudo unzip /tmp/vault.zip -d /usr/bin',
  creates     => '/usr/bin/vault',
  path        => ['/usr/bin'],
  refreshonly => true,
}

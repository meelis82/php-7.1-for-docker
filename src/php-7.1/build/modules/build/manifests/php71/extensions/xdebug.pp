class build::php71::extensions::xdebug {
  require build::php71

  file { '/tmp/xdebug-2.4.0.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/xdebug-2.4.0.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf xdebug-2.4.0.tgz':
    require => File['/tmp/xdebug-2.4.0.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0 && phpize-7.1.26':
    require => Bash_exec['cd /tmp && tar xzf xdebug-2.4.0.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.1.26':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.4.0 && phpize-7.1.26']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.4.0 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.1.26']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.4.0 && make']
  }
}

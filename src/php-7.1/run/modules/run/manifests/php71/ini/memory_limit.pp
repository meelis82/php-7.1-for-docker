class run::php71::ini::memory_limit {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/memory_limit.ini':
    ensure => present,
    content => template('run/php71/ini/memory_limit.ini.erb'),
    mode => "644"
  }
}

class postfix::disable {

  service{'postfix':
    ensure => stopped,
    enable => false,
  }
  package{'postfix':
    ensure => absent,
    require => Service['postfix'],
  }

}

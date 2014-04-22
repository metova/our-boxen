class projects::metova_dev_setup {
  include tmux
  include chrome
  include hipchat
  include iterm2::stable
  include sourcetree
  include eclipse::java
  include wget

  include sublime_text_3
  include sublime_text_3::package_control
  sublime_text_3::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  file { "/workspace":
    ensure => "directory",
    owner  => $boxen_user,
    group  => "staff",
    mode   => 750,
  }

  include ruby_tools

  # Class: ruby_tools
  #
  #
  class ruby_tools {
    include postgresql
    include mysql
    include imagemagick
    include phantomjs
    include redis
    include virtualbox
    include vagrant
    package { "bcrypt":
      ensure => present,
    }
    package { "chromedriver":
      ensure => present,
    }
    package { "rabbitmq":
      ensure => present,
    }
  }


  # Class: ios_tools
  #
  #
  class ios_tools {

    include cocoapods

    Class['cocoapods'] -> Class['ruby_tools']

    package { 'class-dump':
      ensure => present,
    }
    package { 'ios-sim':
      ensure => present,
    }
    package { 'ios-webkit-debug-proxy':
      ensure => present,
    }
    package { 'libimobiledevice':
      ensure => present,
    }
    package { 'lcov':
      ensure => present,
    }

  }
  
}
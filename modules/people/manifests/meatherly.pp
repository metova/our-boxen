class people::meatherly {
  include ohmyzsh
  include alfred
  include projects::metova_dev_setup

  rbenv::version {'2.0.0-p0': }
#  require git::config

#  File <| title == "${git::config::configdir}/gitignore" |> {
#    source => undef,
#    content => template("${boxen::config::home}/repo/modules/projects/templates/shared/gitignore.erb"),
#    require => File["${git::config::configdir}"]
#  }
}
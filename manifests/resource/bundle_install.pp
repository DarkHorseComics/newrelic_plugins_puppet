define newrelic_plugins::resource::bundle_install ($plugin_path) {

  unless defined(Package['bundler']) {
    # install bundler gem
    package { 'bundler' :
      ensure   => present,
      provider => gem
    }
  }

  # bundle install
  exec { "${name}: bundle install":
    path        => $::path,
    command     => 'bundle install',
    cwd         => $plugin_path,
    require     => Package['bundler']
  }
}

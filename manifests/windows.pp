class fcb_java::windows(
  $url,
  $destination_path,
  $install_version,
  $registry_name,
  $java_home,
  $architecture     = $facts['architecture'],
){
  windows_env { "PATH=${java_home}":}

  dsc_xremotefile {"Download jdk-${install_version}-windows-${architecture}.exe":
    dsc_destinationpath => "${destination_path}/jdk-${install_version}-windows-${architecture}.exe",
    dsc_uri             => "${url}/jdk-${install_version}-windows-${architecture}.exe",
  }

  package { $registry_name:
    ensure          => installed,
    source          => "${destination_path}/jdk-${install_version}-windows-${architecture}.exe",
    install_options => ['/s'],
    require         => Dsc_xremotefile[ "Download jdk-${install_version}-windows-${architecture}.exe" ],
  }
}

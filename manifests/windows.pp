class fcb_java::windows(
  $url,
  $destination_path,
  $install_version,
  $registry_name,
  $java_home,
  $jre_home,
  $architecture     = $facts['architecture'],
){
  windows_env { "JAVA_HOME=${java_home}":
    mergemode => clobber,
  }

  windows_env { "JRE_HOME=${jre_home}":
    mergemode => clobber,
  }

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

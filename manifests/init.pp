class fcb_java (
  $config,
){
  case $facts['os']['name'] {
    'RedHat', 'CentOS':  { include fcb_java::linux  }
    'Windows':           { include fcb_java::windows  }
  }
}

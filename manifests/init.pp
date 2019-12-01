class fcb_java{
  case $facts['os']['name'] {
    'RedHat', 'CentOS':  { include java  }
    'Windows':           { include fcb_java::windows  }
  }
}

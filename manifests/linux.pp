class fcb_java::linux (
  $package = 'java-1.8.0-openjdk-devel',
){
  class { 'java':
    package => $package,
  }
}

class fcb_java::linux(
  $config,
){
  class{ 'java':
    * => $config,
  }
}

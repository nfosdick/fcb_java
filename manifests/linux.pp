class fcb_java::linux(
  $config,
){
  java { 'java':
    * => $config,
  }
}

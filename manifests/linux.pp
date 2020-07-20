class fcb_java::linux(
  $config,
){
  java { 'java install':
    * => $config,
  }
}

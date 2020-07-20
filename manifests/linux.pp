class fcb_java::linux{
  $config = $fcb_java::config

  class{ 'java':
    * => $config,
  }
}

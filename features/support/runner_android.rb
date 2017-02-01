require_relative "adb" #pieprasa failu

class RunnerAndroid

  def initialize(device, options)
  @options = options
  @device = device
  @device_name = Adb.device_name(@device)
  end

  def run
    #lai palaistu testus uz pareizo ieriici
    # ; - apvieno unix komandas
    # / - apvieno strung
    command = "export curdevice=#{@device} ;" \
    "export apk=#{@options['apk']} ;" \
    "export port#{@options['port']} ;" \
    "export boot_port=#{@options['boot_port']} ;" \
    "cucumber --tags #{@options['tags']} -f --format #{@options['report']} " \
    " -o reports/#{@device_name}.#{@options['report']} ;"
    p command
  end

end

#tmp = RunnerAndroid.new('P6Q7N15619000832', {'apk' => 'apk', 'port' => '32432', 'boot_port' => '45533', 'tags' => '@tags', 'report' => 'report'})
#tmp.run

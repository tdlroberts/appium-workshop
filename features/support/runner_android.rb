require_relative 'adb' #pieprasa failu

class RunnerAndroid

  def initialize(device, options)
  @options = options
  @device = device
  @device_name = Adb.device_name(@device)
  end

  def run
    #lai palaistu testus uz pareizo ieriici
    # ; - apvieno unix komandas
    # / - apvieno string

    puts "Port: " + "#{@options['port']}"
    puts "Boot port: " + "#{@options['boot_port']}"

    command = "export curdevice=#{@device} ;" \
    "export apk=#{@options['apk']} ;" \
    "export port=#{@options['port']} ;" \
    "export boot_port=#{@options['boot_port']} ;" \
    "cucumber #{@options['tags']} --format #{@options['report']} " \
    " -o reports/#{@device_name}.#{@options['report']}"

    #if(@device == "P6Q7N15619000832")
    #  command = "export curdevice=#{@device} ;" \
    #  "export apk=#{@options['apk']} ;" \
    #  "export port=5500 ;" \
    #  "export boot_port=5600 ;" \
    #  "cucumber #{@options['tags']} --format #{@options['report']} " \
    #  " -o reports/#{@device_name}.#{@options['report']}"
    #else
    #  command = "export curdevice=#{@device} ;" \
    #  "export apk=#{@options['apk']} ;" \
    #  "export port=5501 ;" \
    #  "export boot_port=5601 ;" \
    #  "cucumber #{@options['tags']} --format #{@options['report']} " \
    #  " -o reports/#{@device_name}.#{@options['report']}"
    #end

    p command
    `#{command}`
  end

end

#tmp = RunnerAndroid.new('P6Q7N15619000832', {'apk' => 'apk', 'port' => '5500', 'boot_port' => '5501', 'tags' => '@tags', 'report' => 'report'})
#tmp.run

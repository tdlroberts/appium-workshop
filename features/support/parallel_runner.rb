require_relative 'runner_android'
require_relative 'adb'
require 'yaml'

class ParallelRunner

  def initialize(options)
    @options = options
    all_devices
    @config = YAML.load_file('features/config/devices.yml')
    #@config = YAML.load_file('../config/devices.yml')
    @test_devices_connected = []
    test_devices
    @threads = []
  end

  def all_devices
    @adb_devices_connected = Adb.connected_devices
    puts 'All connected_devices:' + @adb_devices_connected.to_s
    # to_s paarveers masiivu par string sajaa gadiijumaa

  end

  def test_devices
    @config['devices'].each do |device|
      @test_devices_connected.push(device) if @adb_devices_connected.include?(device)
    end
    #vias ieriices uz kuraam izpildaas testi
    puts 'Devices where tests will be executed: ' + @test_devices_connected.to_s
  end

  def run_parallel
    @test_devices_connected.each do |device|
      @options['port'] = @config['port']
      @options['boot_port'] = @config['boot_port']

      @threads << Thread.new do
        puts "options Port: " + "#{@options['port']}"
        puts "config Port: " + "#{@config['port']}"
        RunnerAndroid.new(device, @options).run
      end

      #TODO how to improve this ?
      sleep(1)

      @config['port'] += 1
      @config['boot_port'] += 1
    end
  end

  def wait_for_tests
    #threadiem ir metode join gaida kad visi tredi ir
    #pabeigusi izpildiities un tad iet taalaaak
    @threads.each(&:join)
  end

end

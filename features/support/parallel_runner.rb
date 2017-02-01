require_relative "runner_android"
require_relative "adb"
require 'yaml'

class ParallelRunner

  def initialize
    all_devices
    @config = YAML.load_file('../config/devices.yml')
    @devices_connected = []
    test_devices
  end

  def all_devices
    @adb_devices_connected = Adb.connected_devices
    puts 'All connected_devices:' + @adb_devices_connected.to_s
    # to_s paarveers masiivu par string sajaa gadiijumaa

  end

  def test_devices
    @config['devices'].each do |device|
      @devices_connected.push(device) if @adb_devices_connected.include?(device)
    end
    #vias ieriices uz kuraam izpildaas testi
    puts 'Devices where tests will be executed: ' + @devices_connected.to_s
  end

  def run_parallel

  end

  def wait_for_tests

  end

end

#temp = ParallelRunner.new

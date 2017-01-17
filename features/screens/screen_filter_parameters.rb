class ScreenFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @elements = element(:id, 'row_filter_name') # array of TextViews
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @elements[:type], @elements[:value]
      ).displayed?
    end
  end

 def validate_filter(filter_name)
      exists = 0
     @driver.find_elements(
       @elements[:type], @elements[:value]
     ).each do |row|
       next unless row.text == filter_name
          exists = 1
       break
     end
     # if filter does not exist fail the test
     if exists == 0
       fail('Filter: ' + filter_name + 'does not exist')
     end
 end
end

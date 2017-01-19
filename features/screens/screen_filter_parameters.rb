class ScreenFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @row_filter_name = element(:id, 'row_filter_name') # array of TextViews
    #@text_view_class = element(:class, 'android.widget.TextView')
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @row_filter_name[:type], @row_filter_name[:value]
      ).displayed?
    end
  end

 def validate_filter(filter_name)
      exists = false
     @driver.find_elements(
       @row_filter_name[:type], @row_filter_name[:value]
     ).each do |row|
       next unless row.text == filter_name
          exists = true
       break
     end
     # if filter does not exist fail the test
     if exists
       fail('Filter: ' + filter_name + 'does not exist')
     end
 end
end

class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder') # An array of Relative layouts
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @parameter_holders[:type], @parameter_holders[:value]
      ).displayed?
    end
  end

  def set_name(text_name)
    @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).type(text_name)
  end

  def set_cell_value(text_view_value, edit_text_value, location)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    #find all relative layouts in array iterate through them until a relative layout is found
    ).each do |row|
      # iterate to next layout unless it contains TextView with appropriate text
      next unless row.find_element(:id, 'parameter_name').text == text_view_value
      row.find_element(:id, location).send_keys(edit_text_value)
      break
    end
  end

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
  end

end

class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder') # An array of Relative layouts
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @parameter_name = element(:id, 'parameter_name')
    @parameter_left = element(:id, 'left_param')
    @parameter_right = element(:id, 'right_param')
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

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
  end

  def set_parameter(parameter, param_left, param_right)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    #find all relative layouts in array iterate through them until a relative layout is found
    ).each do |row|
      # iterate to next layout unless it contains TextView with appropriate text
      next unless row.find_element(@parameter_name[:type], @parameter_name[:value]).text == parameter
      row.find_element(@parameter_left[:type], @parameter_left[:value]).send_keys(param_left)
      row.find_element(@parameter_right[:type], @parameter_right[:value]).send_keys(param_right)
      break
    end
  end

  def is_filter_created
    begin
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    )
  rescue
      fail('Unable to create filter, filter may already exist')
  end
  end

end

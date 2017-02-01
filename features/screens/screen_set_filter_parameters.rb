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

  def set_parameter(parameter_hash)

    not_found = true
    while not_found do
      @driver.find_elements(
        @parameter_holders[:type], @parameter_holders[:value]
      ).each do |row|
        # iterate to next layout unless it contains TextView with appropriate text
        next unless row.find_element(@parameter_name[:type], @parameter_name[:value]).text == parameter_hash['name']
        row.find_element(@parameter_left[:type], @parameter_left[:value]).send_keys(parameter_hash['left'])
        row.find_element(@parameter_right[:type], @parameter_right[:value]).send_keys(parameter_hash['right'])
        @driver.hide_keyboard
        not_found = false
        break
      end
      if not_found
        #check if bottom page element is visble
        if (@driver.find_elements(
          @parameter_holders[:type], @parameter_holders[:value]
          ).last.text == "DARBĪBAS VEIDS")
            #end cycle
            not_found = false
          else
            height = @driver.window_size.height - 1
            #swipe from bottom of screen to top of screen
            @driver.swipe(startx: 0, starty: height, delta_x: 0, delta_y: 1, duration: 900)
          end
      end

    end
  end

end

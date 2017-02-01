class ScreenNotification < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @button_open_menu = element(:class, 'android.widget.ImageButton')

    @driver = driver
  end

  def visible?
    @driver.wait { @driver.find_element(@button_open_menu[:type], @button_open_menu[:value]).displayed? }
  end

  def open_menu
    @driver.find_element(@button_open_menu[:type], @button_open_menu[:value]).click
  end

end

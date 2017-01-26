class ScreenExtraFilters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'buy_title_text')
    @button_close_extra_filters = element(:id, 'dialog_buy_cancel')
    @driver = driver
  end

  def visible?
    @driver.wait { @driver.find_element(@base[:type], @base[:value]).displayed? }
  end

  def close_extra_filters
    @driver.find_element(@button_close_extra_filters[:type], @button_close_extra_filters[:value]).click
  end
end

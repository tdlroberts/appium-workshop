class ScreenNotificationMenu < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @button_new_filter = element(:id, 'item_name')

    @driver = driver
  end

  def visible?
    @driver.wait { @driver.find_element(@button_new_filter[:type], @button_new_filter[:value]).displayed? }
  end

  def open_new_filter_menu
    @driver.find_elements(
    @button_new_filter[:type], @button_new_filter[:value]
    ).each do |list_item|
      next unless list_item.text == "Izveidot filtru"
      list_item.click
      break
    end
  end

end

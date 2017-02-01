class ScreenSelectSubCategory < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @rows = element(:id, 'category_name')
    @driver = driver
  end

  def visible?(title)
    @driver.wait { @driver.text(title).displayed? }
    @driver.wait do
      @driver.find_element(
        @rows[:type], @rows[:value]
      ).displayed?
    end
  end

  def select_sub_category(sub_name)
    found = true
    #cycle wont stop until end of list is reached
    while found do
      categories = @driver.find_elements(
        @rows[:type], @rows[:value]
      )

    categories.each do |category|
      next unless category.text == sub_name
      category.click
      found = false
      break
    end

    #if element is not found swipe down and see if last element matches if it does end cycle
    if found
      last_element = categories.last.text
      height = @driver.window_size.height - 1
      # swipe from bottom of screen to top of screen
      @driver.swipe(startx: 0, starty: height, delta_x: 0, delta_y: 1, duration: 900)
      if(last_element == @driver.find_elements(@rows[:type], @rows[:value]).last.text)
        found = false
        fail(sub_name + " not found in list")
      end
    end

  end
    #visible = false
    #@driver.find_elements(
    #  @rows[:type], @rows[:value]
    #).each do |row|
    #  next unless row.text == sub_name
    #  row.click
    #  visible = true
    #  break
    #end
    #@driver.scroll_to(sub_name).click unless visible
  end
end

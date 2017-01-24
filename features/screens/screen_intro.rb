class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    #most efficient way of finding this element is by id
    @button_close_intro = element(:id, 'close_intro')
    #for all these elements most efficient way of locating them is by id
    @imageView_intro_footer_image = element(:id, 'intro_footer_image')
    @imageView_page_image = element(:id, 'page_image')
    @textView_intro_text_header = element(:id, 'intro_text_header')
    @textView_intro_text_footer = element(:id, 'intro_text_footer')
    @driver = driver
  end

  def visible?
    #click the no email notification button
    @driver.alert_accept
    @driver.find_element(@base[:type], @base[:value])
    @driver.find_element(@button_close_intro[:type], @button_close_intro[:value])
    @driver.find_element(@imageView_intro_footer_image[:type], @imageView_intro_footer_image[:value])
    @driver.find_element(@imageView_page_image[:type], @imageView_page_image[:value])
    @driver.find_element(@textView_intro_text_header[:type], @textView_intro_text_header[:value])
    @driver.find_element(@textView_intro_text_footer[:type], @textView_intro_text_footer[:value])
  end

  def close_intro
    @driver.find_element(@button_close_intro[:type], @button_close_intro[:value]).click
  end
end

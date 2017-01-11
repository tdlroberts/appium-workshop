class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    #chose button id because it is the only unique value
    @button_close_intro = element(:id, 'close_intro')
    #chose id, unique value
    @imageView_intro_footer_image = element(:id, 'intro_footer_image')
    #id, unique
    @imageView_page_image = element(:id, 'page_image')
    #id, unique
    @textView_intro_text_header = element(:id, 'intro_text_header')
    #found by id, unique value
    @textView_intro_text_footer = element(:id, 'intro_text_footer')
    @driver = driver
  end

  def visible?
    #click the no email notification button
    driver.find_element(:class_name, 'android.widget.Button').click()
    @driver.find_element(@base[:type], @base[:value])
    @driver.find_element(@button_close_intro[:type], @button_close_intro[:value])
    @driver.find_element(@imageView_intro_footer_image[:type], @imageView_intro_footer_image[:value])
    @driver.find_element(@imageView_page_image[:type], @imageView_page_image[:value])
    @driver.find_element(@textView_intro_text_header[:type], @textView_intro_text_header[:value])
    @driver.find_element(@textView_intro_text_footer[:type], @textView_intro_text_footer[:value])
  end
end

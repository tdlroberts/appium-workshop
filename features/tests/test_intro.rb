class TestIntro
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def intro_visible?
    @screens.screen_intro.visible?
  end

  def close_intro
    @screens.screen_intro.visible?
    @screens.screen_intro.close_intro
  end

  def close_extra_filters
    @screens.screen_extra_filters.visible?
    @screens.screen_extra_filters.close_extra_filters
  end
end

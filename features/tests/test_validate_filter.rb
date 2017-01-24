class TestValidateFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def validate_filter
    @screens.screen_filter_parameters.visible?
    @screens.screen_filter_parameters.validate_filter('Ventspils2')
  end

end

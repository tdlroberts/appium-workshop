class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  #Filter_name = 'Ventspils2'  #Constant that can be accessed within this class and all of its functions

  def select_category(category)
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row category
  end

  def select_type
    @screens.screen_select_sub_category.visible?('Nekustamie īpašumi')
    @screens.screen_select_sub_category.select_sub_category 'Zeme'
  end

  def select_district
    @screens.screen_select_sub_category.visible?('Zeme')
    @screens.screen_select_sub_category.select_sub_category 'Ventspils un rajons'
  end

  def select_town
    @screens.screen_select_sub_category.visible?('Ventspils un rajons')
    @screens.screen_select_sub_category.select_sub_category 'Visi'
  end

  def select_action
    @screens.screen_select_sub_category.visible?('Darbība')
    @screens.screen_select_sub_category.select_sub_category 'Visi'
  end

  def submit_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  # Function for creating an empty filter
  def create_empty_filter
    select_category 'Nekustamie īpašumi'
    select_type
    select_district
    select_town
    select_action
    submit_filter_parameters
  end


def enter_name
  @screens.screen_set_filter_parameters.set_name('Ventspils2')
end

def set_price
  @screens.screen_set_filter_parameters.visible?
  @screens.screen_set_filter_parameters.set_parameter('CENA (EUR)', '4', '18')
end

def set_area
  @screens.screen_set_filter_parameters.visible?
  @screens.screen_set_filter_parameters.set_parameter('PLATĪBA (M2)', '21', '212')
end

# Save a filled filter
def create_filled_filter
  enter_name
  set_price
  set_area
  submit_filter_parameters
end

# See if Filter exists
  def validate_filter
    @screens.screen_filter_parameters.visible?
    @screens.screen_filter_parameters.validate_filter('Ventspils2')
  end

end

require_relative '../screens/screen_base'

class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
    @data = Filter.new('property_positive')
  end

  def select_category(category)
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row category
  end

  def select_type
    @screens.screen_select_sub_category.visible?(@data.sub_categories[0]['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories[0]['option']
  end

  def select_district
    @screens.screen_select_sub_category.visible?(@data.sub_categories[1]['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories[1]['option']
  end

  def select_town
    @screens.screen_select_sub_category.visible?(@data.sub_categories[2]['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories[2]['option']
  end

  def select_action
    @screens.screen_select_sub_category.visible?(@data.sub_categories[3]['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories[3]['option']
  end

  def submit_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  # Create an empty filter
  def create_empty_filter
    select_category @data.category
    select_type
    select_district
    select_town
    select_action
    submit_filter_parameters
  end


def enter_name
  @screens.screen_set_filter_parameters.set_name(@data.name)
end

def set_price
  @screens.screen_set_filter_parameters.visible?
  @screens.screen_set_filter_parameters.set_parameter(@data.parameters[0]['name'], @data.parameters[0]['left'], @data.parameters[0]['right'])
end

def set_area
  @screens.screen_set_filter_parameters.visible?
  @screens.screen_set_filter_parameters.set_parameter(@data.parameters[1]['name'], @data.parameters[1]['left'], @data.parameters[1]['right'])
end

def check_filter_created
  @screens.screen_filter_parameters.is_filter_created
end

# Save a filled filter
def create_filled_filter
  enter_name
  set_price
  set_area
  submit_filter_parameters
  check_filter_created
end

end

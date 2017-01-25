#require_relative '../screens/screen_base'

class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def load_filter_data(filter_name)
    @data = Filters.new(filter_name)
  end

  def select_category(category_name)
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row(category_name)
  end

  def select_sub_category(title, option)
    @screens.screen_select_sub_category.visible?(title)
    @screens.screen_select_sub_category.select_sub_category(option)
  end

  def submit_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  # Create an empty filter
  def create_empty_filter
    load_filter_data('property_positive')
    select_category(@data.category)
    select_sub_category(@data.sub_categories[0]['title'], @data.sub_categories[0]['option'])
    select_sub_category(@data.sub_categories[1]['title'], @data.sub_categories[1]['option'])
    select_sub_category(@data.sub_categories[2]['title'], @data.sub_categories[2]['option'])
    select_sub_category(@data.sub_categories[3]['title'], @data.sub_categories[3]['option'])
    submit_filter_parameters
  end


def enter_name(name)
  @screens.screen_set_filter_parameters.set_name(name)
end

def set_parameter(name, left, right)
  @screens.screen_set_filter_parameters.visible?
  @screens.screen_set_filter_parameters.set_parameter(name, left, right)
end

def check_filter_created
  @screens.screen_filter_parameters.is_filter_created
end

# Save a filled filter
def create_filled_filter
  enter_name(@data.name)
  set_parameter(@data.parameters[0]['name'], @data.parameters[0]['left'], @data.parameters[0]['right'])
  set_parameter(@data.parameters[1]['name'], @data.parameters[1]['left'], @data.parameters[1]['right'])
  submit_filter_parameters
  check_filter_created
end

end

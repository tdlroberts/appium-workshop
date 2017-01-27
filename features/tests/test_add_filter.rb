require_relative '../config/filters'

class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
    load_filter_data('property_positive')
  end

  def load_filter_data(filter_name)
    @data = Filters.new(filter_name)
  end

  def create_filter_screen_displayed
    @screens.screen_create_filter.visible?
  end

  def select_category
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row(@data.category)
  end

  def select_sub_category(sub_cat_hash)
    @screens.screen_select_sub_category.visible?(sub_cat_hash['title'])
    @screens.screen_select_sub_category.select_sub_category(sub_cat_hash['option'])
  end

  def navigate_to_filter_screen
    @data.sub_categories.each do |sub_category|
          select_sub_category(sub_category)
    end
  end

  def submit_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def set_filter_name
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name(@data.name)
  end

  def set_parameter(parameter)
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_parameter(parameter)
  end

  def set_all_parameters
    @data.parameters.each do |parameter|
      set_parameter(parameter)
    end
  end

  def filter_exists
    @screens.screen_filter_parameters.is_filter_created
  end

  def validate_filter(filter_name)
    @screens.screen_filter_parameters.visible?
    @screens.screen_filter_parameters.validate_filter(filter_name)
  end

# Create an empty filter
def create_empty_filter
  select_category
  navigate_to_filter_screen
  submit_filter_parameters
end

# Save a filled filter
def create_filled_filter
  select_category
  navigate_to_filter_screen
  set_filter_name
  set_all_parameters
  submit_filter_parameters
  filter_exists
end

def validate_created_filter
  validate_filter(@data.name)
end

end

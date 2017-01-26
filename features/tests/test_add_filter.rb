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

  def set_filter_name(name)
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name(name)
  end

  def set_parameter(name, left, right)
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_parameter(name, left, right)
  end

  def validate_filter(filter_name)
    @screens.screen_filter_parameters.visible?
    @screens.screen_filter_parameters.validate_filter(filter_name)
  end

# Create an empty filter
def create_empty_filter
  select_category(@data.category)
  @data.sub_categories.each do |sub_category|
        select_sub_category(sub_category['title'], sub_category['option'])
  end
  submit_filter_parameters
end

# Save a filled filter
def create_filled_filter
  select_category(@data.category)
  @data.sub_categories.each do |sub_category|
        select_sub_category(sub_category['title'], sub_category['option'])
  end
  set_filter_name(@data.name)
  @data.parameters.each do |parameter|
    set_parameter(parameter['name'], parameter['left'], parameter['right'])
  end
  submit_filter_parameters
  @screens.screen_filter_parameters.is_filter_created
end

def validate_created_filter
  validate_filter(@data.name)
end

end

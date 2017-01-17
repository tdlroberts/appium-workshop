class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  Filter_name = 'Ventspils2'
  Price_from = 4
  Price_to = 18
  Area_from = 21
  Area_to = 212

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

  def enter_name
    @screens.screen_set_filter_parameters.set_name(Filter_name)
  end

  def enter_price_from
    @screens.screen_set_filter_parameters.set_cell_value('CENA (EUR)', Price_from, 'left_param')
  end

  def enter_price_to
    @screens.screen_set_filter_parameters.set_cell_value('CENA (EUR)', Price_to, 'right_param')
  end

  def enter_area_from
    @screens.screen_set_filter_parameters.set_cell_value('PLATĪBA (M2)', Area_from, 'left_param')
  end

  def enter_area_to
    @screens.screen_set_filter_parameters.set_cell_value('PLATĪBA (M2)', Area_to, 'right_param')
  end

# Try to save an empty filter
  def create_empty_filter
    select_category 'Nekustamie īpašumi'
    select_type
    select_district
    select_town
    select_action
    submit_filter_parameters
  end

# Save a filled filter
  def create_filled_filter
    enter_name
    enter_price_from
    enter_price_to
    enter_area_from
    enter_area_to
    submit_filter_parameters
  end

# See if Filter exists
  def validate_filter
    @screens.screen_filter_parameters.visible?
    @screens.screen_filter_parameters.validate_filter(Filter_name)
  end

end

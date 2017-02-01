require 'yaml'
class Filters
  @parameters = []

attr_accessor :name, :category, :sub_categories, :parameters

  def initialize(type)
    #other path for checking values via console
    #config = YAML.load_file('filters.yml')[type]
    config = YAML.load_file('features/config/filters.yml')[type]
    if !config['name'].nil?
      self.name = config['name']
    end
    if !config['category'].nil?
      self.category = config['category']
    end
    self.sub_categories = []
    if !config['sub_categories'].nil?
      config['sub_categories'].each do |sub_cat|
        self.sub_categories.push sub_cat
      end
      #temp_hash = {'title' => sub_cat['sub_category'][0]['title'], 'option' => sub_cat['sub_category'][1]['option']}
      # adds temp_hash array at the end of sub_categories array
      #self.sub_categories.push temp_hash
    end
    self.parameters = []
    # if parameters array is initialized
    if !config['parameters'].nil?
      config['parameters'].each do |param|
        self.parameters.push param
      end
      #temp_hash = {'name' => param['parameter'][0]['name'], 'left' => param['parameter'][1]['left'], 'right' => param['parameter'][2]['right']}
      #self.parameters.push temp_hash
    end
  end

  def print_properties
    print "Name:\t\t" + self.name
    print "\nCategory:\t" + self.category
    print "\nSub Categories:"
    self.sub_categories.each do |sub_cat|
      print "\n\tTitle:\t" + sub_cat['title'] + "\n\tOption:\t" + sub_cat['option'] + "\n"
    end
    print "Parameters:"
    self.parameters.each do |param|
      print "\n\tName:\t" + param['name'] + "\n\tLeft:\t" + param['left'] + "\n\tRight:\t" + param['right'] + "\n"
    end
  end
end

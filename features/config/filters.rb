require 'yaml'
class Filter
  @parameters = []

attr_accessor :name, :category, :sub_categories, :parameters

  def initialize(type)
    #loads .yml file values
    #config = YAML.load_file('filters.yml')[type]
    config = YAML.load_file('features/config/filters.yml')[type]
    self.name = config['name']
    self.category = config['category']
    self.sub_categories = []
    config['sub_categories'].each do |sub_cat|
      # in hash array defines element 'title' with
      temp_hash = {'title' => sub_cat['sub_category'][0]['title'], 'option' => sub_cat['sub_category'][1]['option']}
      # adds temp_hash array at the end of sub_categories array
      self.sub_categories.push temp_hash
    end
    self.parameters = []
    config['parameters'].each do |param|
      temp_hash = {'name' => param['parameter'][0]['name'], 'left' => param['parameter'][1]['left'], 'right' => param['parameter'][2]['right']}
      self.parameters.push temp_hash
    end
    #@test = config['sub_categories']

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

    #puts @test[0]['sub_category'][0]['title']

  end
end

filter = Filter.new('property_positive')

puts filter.parameters[0]['right']

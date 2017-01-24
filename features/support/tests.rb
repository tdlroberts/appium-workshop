class Tests
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end
  def test_intro
    @test_intro ||= TestIntro.new(@screens)
    @test_intro
  end

  def test_add_filter
    @test_add_filter ||= TestAddFilter.new(@screens)
    @test_add_filter
  end

  def test_validate_filter
    @test_validate_filter ||= TestValidateFilter.new(@screens)
    @test_validate_filter
  end

end

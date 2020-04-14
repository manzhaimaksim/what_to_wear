class Thing
  attr_reader :title, :category, :temp_range

  def initialize(params)
    @title = params[:title]
    @category = params[:category]
    @temp_range = params[:temp_range]
  end

  def suitable_for_weather?(temperature)
    @temp_range.include?(temperature)
  end

  def to_s
    "#{@title} (#{@category}) #{@temp_range}"
  end
end

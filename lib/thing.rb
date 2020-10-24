class Thing
  attr_reader :title, :category, :temp_range

  def initialize(params)
    @title = params[:title]
    @category = params[:category]
    @temp_range = Range.new(*params[:temp_range].delete('()').split(', ').map(&:to_i))
  end

  def suitable_for_weather?(temperature)
    @temp_range.include?(temperature)
  end

  def to_s
    "#{@title} (#{@category}) (#{@temp_range.min}, #{@temp_range.max})"
  end
end

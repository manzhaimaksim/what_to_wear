class Thing
  attr_reader :title, :category, :temp_range

  def initialize(params)
    @title = params[:title]
    @category = params[:category]
    @temp_range = convert_string_to_range(params[:temp_range])
  end

  def suitable_for_weather?(temperature)
    @temp_range.include?(temperature)
  end

  def to_s
    "#{@title} (#{@category}) (#{@temp_range.min}, #{@temp_range.max})"
  end

  private

  def convert_string_to_range(string)
    string = string.delete('()').split(', ').map(&:to_i)
    string[0]..string[1]
  end
end

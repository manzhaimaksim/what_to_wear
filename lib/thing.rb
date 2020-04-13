class Thing
  attr_reader :title, :category, :temp_range

  def self.things_from_folder(paths)
    things = []
    paths.each do |path|
      lines = File.readlines(path, chomp: true, encoding: 'UTF-8')

      lines[2] = lines[2].delete('()').split(', ').map(&:to_i)

      params = { title: lines[0], category: lines[1], temp_range: lines[2][0]..lines[2][1] }
      things << self.new(params)
    end
    things
  end

  def initialize(params)
    @title = params[:title]
    @category = params[:category]
    @temp_range = params[:temp_range]
  end

  def suitable_for_weather?(temperature)
    temperature.between?(@temp_range)
  end

  def to_s
    "#{@title} (#{@category}) #{@temp_range}"
  end
end

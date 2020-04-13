class Thing
  def self.things_from_folder(paths)
    paths.each do |path|
      lines = File.readlines(path, chomp: true, encoding: 'UTF-8')
      params = {title: lines[0], category: lines[1], temp_range: lines[2]}
      self.new(params)
    end

  end

  def initialize(params)
    @title = params[:title]
    @category = params[:category]
    @temp_range = params[:temp_range]
  end
end

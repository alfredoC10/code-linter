class ReadFile
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def pick_lines
    file_lines = []
    File.open(@file_path, 'r') do |css_file|
      css_file.readlines.each { |line| file_lines << line.chomp }
    end
    file_lines
  end
end

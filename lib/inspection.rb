require_relative 'file_reading'
require 'colorize'

class FileChecker
  attr_reader :file_lines, :results

  def initialize(file_lines)
    @file_lines = file_lines
    @results = []
  end

  private

  def spaces_before_semicolon
    @file_lines.each_with_index do |line, i|
      if !line.match?(/({|})/) && line.match?(/;/) && line.match?(/\s;/)
        @results << "\n#{'x '.red}Line #{(i + 1).to_s.bold.cyan}: unexepected space before ';', please remove it"
      end
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def space_after_colon
    @file_lines.each_with_index do |line, i|
      if !line.match?(/({|})/) && line.match?(/:/) && !line.match?(/:\s/)
        @results << "\n#{'x '.red}Line #{(i + 1).to_s.bold.cyan}: expected space after ':', add it"
      elsif !line.match?(/({|})/) && line.match?(/:/) && line.match?(/:\s\s+/)
        @results << "\n#{'x '.red}Line #{(i + 1).to_s.bold.cyan}: there are more than one single space after ':',"
      end
    end
  end

  def space_after_comma
    @file_lines.each_with_index do |line, i|
      if line.match?(/;/) && line.match?(/,\S/)
        @results << "\n#{'x '.red}Line #{(i + 1).to_s.bold.cyan}: expected single space after ',' ,please add it"
      elsif line.match?(/;/) && line.match?(/,\s\s+/)
        @results << "\n#{'x '.red}Line #{(i + 1).to_s.bold.cyan}: there are more than a single space after ','"
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  def no_selector_new_line
    @file_lines.each_with_index do |line, i|
      if line.match?(/\{/) && line.match(/,/)
        @results << "\n#{'x '.red}Line #{(i + 1).to_s.bold.cyan}: missing new line after ',' in a list of selectors"
      end
    end
  end

  public

  def examine_lines
    spaces_before_semicolon
    space_after_colon
    space_after_comma
    no_selector_new_line
  end

  def publish_results
    if @results.size.positive?
      puts @results
      puts ' '
      puts "1 file inspected,#{" #{@results.size} damages ".red}detected"
    else
      puts ' '
      puts "1 file inspected,#{" #{@results.size} damages ".green}detected, all the tests have passed!"
    end
  end
end

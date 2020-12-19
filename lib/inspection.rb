require_relative 'file_reading'
require 'colorize'

class FileChecker
  attr_reader :file_lines

  @@results = []

  def initialize(file_lines)
    @file_lines = file_lines
  end

  private

  def spaces_before_semicolon
    @file_lines.each_with_index do |line, idx|
        if !line.match?(/({|})/) && line.match?(/;/) && line.match?(/\s;/)
          @@results << "\n#{'x '.red}Line #{(idx + 1).to_s.bold.cyan}: unexepected single space before ';', please reomove it\n"
        end
    end
  end

  def no_space_after_colon
    @file_lines.each_with_index do |line, idx|
        if !line.match?(/({|})/) && line.match?(/:/) && line.match(/;/) && !line.match?(/:\s/)
          @@results << "\n#{'x '.red}Line #{(idx + 1).to_s.bold.cyan}#{": expected single space after ':', please add it".yellow}\n"
        end
      end
    end
  end

  def no_space_after_comma
    @file_lines.each_with_index do |line, idx|
      unless line.match?(/({|})/) || !line.match?(/;/)
        line.split(', ').each do |itm|
          if itm.match?(/,/)
            @@results << "\n#{'x '.red}Line #{(idx + 1).to_s.bold.cyan}: expected single space after ',', please add it\n"
          end
        end
      end
    end
  end

  def no_selector_new_line
    @file_lines.each_with_index do |line, idx|
      if line.match?(/\{/) && line.match(/,/)
        @@results << "\n#{'x '.red}Line #{(idx + 1).to_s.bold.cyan}#{": expepected new line after ',' in a list of selectors".yellow}\n"
      end
    end
  end

  public

  def examine_lines
    spaces_before_semicolon
    no_space_after_colon
    no_space_after_comma
    no_selector_new_line
  end

  def self.publish_results
    if @@results.size.positive?
      puts @@results
      puts ' '
      puts "1 file inspected,#{" #{@@results.size} damages ".red}detected"
    else
      puts ' '
      puts "1 file inspected,#{" #{@@results.size} damages ".green}detected, all the tests have passed!"
    end
  end

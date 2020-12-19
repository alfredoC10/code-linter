require_relative '../lib/file_reading.rb'
require 'colorize'

file_launcher = ReadFile.new(ARGV.first)
line_inspector = FileChecker.new(file_launcher.pick_lines)
line_inspector.examine_lines
FileChecker.publish_the_results
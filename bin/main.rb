require_relative '../lib/file_reading'
require_relative '../lib/inspection'
require 'colorize'

file_launcher = Opening.new(ARGV.first)
line_inspector = FileChecker.new(file_launcher.pick_lines)
line_inspector.examine_lines
FileChecker.publish_results

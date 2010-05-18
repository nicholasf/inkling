require 'inkling/version'
if %w(--version -v).include? ARGV.first
  puts "Inkling #{Inkling::VERSION}"
  exit(0)
end

ARGV << "--help"   if ARGV.empty?
require 'rubygems' if ARGV.include?("--dev")

require 'inkling/commands/generator'

Inkling::Generator.new.start

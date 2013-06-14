require 'rubygems'
require 'bundler/setup'

require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/setup'
require 'wrong'
require 'wrong/adapters/minitest'

begin
  require 'minitest/ansi'
rescue LoadError                # that's fine, we'll live without it
else
  MiniTest::ANSI.use! if STDOUT.tty?
end

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
  SimpleCov.command_name 'rake spec'
end

require <%= name.inspect %>

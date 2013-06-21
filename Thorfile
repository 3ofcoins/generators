# -*- ruby -*-

require 'rubygems'
require 'bundler/setup'
require 'pathname'

LIBDIR = Pathname.new(__FILE__).dirname.join('lib').to_s
$:.unshift(LIBDIR) unless $:.include?(LIBDIR)

require '3ofcoins/generators'

class Default < Thor
  include Thor::Actions

  desc :install, 'Install generator tasks'
  def install
    empty_directory 'tmp'
    create_file 'tmp/gen.thor', <<EOF
$:.unshift(#{LIBDIR.inspect}) unless $:.include?(#{LIBDIR.inspect})
require '3ofcoins/generators'
EOF
    thor :install, 'tmp/gen.thor', :as => 'gen', :force => true
  end
end

# -*- ruby -*-

require 'rubygems'
require 'bundler/setup'
require 'pathname'

SENTINEL_ENV_VAR = 'INSTALLING_GENERATORS_DONT_LOAD_THEM'
LIBDIR = Pathname.new(__FILE__).dirname.join('lib').to_s
$:.unshift(LIBDIR) unless $:.include?(LIBDIR)

require '3ofcoins/generators' unless ENV[SENTINEL_ENV_VAR]

class Default < Thor
  include Thor::Actions

  desc :install, 'Install generator tasks'
  def install
    empty_directory 'tmp'
    create_file 'tmp/gen.thor', <<EOF
$:.unshift(#{LIBDIR.inspect}) unless $:.include?(#{LIBDIR.inspect})
require '3ofcoins/generators'
EOF
    ENV[SENTINEL_ENV_VAR] = '1'
    thor :install, 'tmp/gen.thor', :as => 'gen', :force => true
  end
end

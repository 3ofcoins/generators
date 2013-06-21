# -*- ruby -*-

require 'minigit'
require 'pathname'

class Gen < Thor
  include Thor::Actions
  attr_reader :name, :snake_name, :camel_name, :title_name
  source_root Pathname.new(__FILE__).
    dirname.dirname.dirname.join('skeletons').realpath

  source_root.each_child do |skel_path|
    next unless skel_path.fnmatch? '*.skel'
    skel_name = skel_path.basename('.skel').to_s
    desc "#{skel_name} TARGET_PATH", "Build a skeleton #{skel_name}"
    define_method(skel_name.gsub('-', '_')) do |target_path|
      target_path = Pathname.new(target_path).expand_path
      # raise "Won't overwrite" if target_path.exist?
      @name = target_path.basename.to_s
      @snake_name = name.downcase.split(/[^a-z0-9]+/).join('_')
      @camel_name = Thor::Util.camel_case(snake_name)
      @title_name = snake_name.split('_').map(&:capitalize).join(' ')
      directory skel_path, target_path, :exclude_pattern => /~$/

      if target_path.join('.git').exist?
        say_status 'git', 'Repository already exists.', :blue
      else
        say_status 'git', "init #{target_path}"
        MiniGit.init(target_path)
      end
    end
  end

  no_commands do
    def git_config(var)
      MiniGit::Capturing.config(var).strip
    end
  end
end

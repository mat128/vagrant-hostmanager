require 'vagrant-hostmanager-lite/plugin'
require 'vagrant-hostmanager-lite/version'
require 'vagrant-hostmanager-lite/errors'

module VagrantPlugins
  module HostManager
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end

    I18n.load_path << File.expand_path('locales/en.yml', source_root)
    I18n.reload!
  end
end

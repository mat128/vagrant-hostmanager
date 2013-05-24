require 'vagrant-hostmanager/action/update_hosts_file'

module VagrantPlugins
  module HostManager
    class Plugin < Vagrant.plugin('2')
      name 'HostManager'
      description <<-DESC
        This plugin manages the /etc/hosts file for guest machines. An entry is
        created for each active machine using the hostname attribute.
      DESC

      config(:hostmanager) do
        require_relative 'config'
        Config
      end

      action_hook(:hostmanager, :machine_action_up) do |hook|
        if VagrantPlugins.const_defined?("OpenStack") && VagrantPlugins::OpenStack.const_defined?("Action")
          hook.before(VagrantPlugins::OpenStack::Action::CreateServer, Action::UpdateHostsFile)
        else
          hook.prepend(Action::UpdateHostsFile)
        end
      end

      action_hook(:hostmanager, :machine_action_destroy) do |hook|
        hook.append(Action::UpdateHostsFile)
      end

      command(:hostmanager) do
        require_relative 'command'
        Command
      end
    end
  end
end

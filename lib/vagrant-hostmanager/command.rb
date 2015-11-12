module VagrantPlugins
  module HostManager
    class Command < Vagrant.plugin('2', :command)
      include HostsFile

      def execute
        options = {}
        opts = OptionParser.new do |o|
          o.banner = 'Usage: vagrant hostmanager [vm-name]'
          o.separator ''
          o.version = VagrantPlugins::HostManager::VERSION
          o.program_name = 'vagrant hostmanager'

          o.on('--provider provider', String,
            'Update machines with the specific provider.') do |provider|
            options[:provider] = provider
          end
        end

        argv = parse_options(opts)
        return if !argv

        options[:provider] ||= @env.default_provider

        generate(@env, options[:provider].to_sym)

        if argv.length == 0
          @env.active_machines.each do |active_name, active_provider|
            puts active_name
            machine = @env.machine(active_name, active_provider)
            update(machine)
          end
        else
          with_target_vms(argv, options) do |machine|
            update(machine)
          end
        end
      end
    end
  end
end

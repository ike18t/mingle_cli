require 'main'
require 'app/models/config_service'

Main {
  mode 'config' do
    option('hostname') {
      argument :optional
      description 'Set the server hostname used to access mingle'
    }

    option('username') {
      argument :optional
      description 'Set the username used to access mingle'
    }

    option('password') {
      argument :optional
      description 'Set the password used to access mingle'
    }

    def run
      updated = params.select{|p| p.given == true}
      updated = updated.inject({}) do |result, p|
        result[p.names.first.to_sym] = p.values.first
        result
      end
      Application::ConfigService.update updated
    end

    mode 'view' do
      puts Application::ConfigService.get.inspect
      description 'Quick view of the current config'
    end
  end

  def run
    puts "default"
  end
}

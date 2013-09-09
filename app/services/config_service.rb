require 'yaml'
require_relative '../models/config'

module Application
  class ConfigService
    def self.update updates
      updates.each do |key, value|
        get.send("#{key}=", value)
      end
      save
    end

    def self.get
      @config = @config || (read() || Config.new)
    end

    protected
    FILENAME = '.config'

    def self.save
      File.open(FILENAME, 'w+') do |f|
        f.write get.to_yaml
      end
    end

    def self.read
      config_data = File.read(FILENAME)
      YAML::load(config_data)
    rescue Errno::ENOENT
      nil
    end
  end
end

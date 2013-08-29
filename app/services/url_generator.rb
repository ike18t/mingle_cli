require_relative '../services/config_service'

class UrlGenerator
  SITE = 'http://%s:%s@%s/api/v2/projects/ove_2'

  def self.generate
    config = Application::ConfigService.get
    SITE % [config.username, config.password, config.hostname]
  end
end


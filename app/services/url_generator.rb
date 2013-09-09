require_relative '../services/config_service'

class UrlGenerator
  SITE = 'http://%s:%s@%s/api/v2/projects/%s'

  def self.generate
    config = Application::ConfigService.get
    SITE % [config.username, config.password, config.hostname, config.project]
  end
end


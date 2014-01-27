class UrlGenerator
  require_relative '../services/config_service'

  SITE = 'http://%s:%s@%s/api/v2/projects/%s'

  def self.generate
    config = Application::ConfigService.get
    SITE % [config.username, config.password, config.hostname, config.project]
  end
end


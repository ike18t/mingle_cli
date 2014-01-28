class UrlGenerator
  SITE = 'http://%s:%s@%s/api/v2/projects/%s'

  def self.generate
    config = ConfigService.get
    SITE % [config.username, config.password, config.hostname, config.project]
  end
end

require 'spec_helper'

describe UrlGenerator do
  it 'return formatted url' do
    config = AppConfig.new :username => 'username', :password => 'password', :hostname => 'hostname', :project => 'project'
    ConfigService.stubs(:get).returns(config)
    url = UrlGenerator.generate
    expected_site = UrlGenerator::SITE  % [config.username, config.password, config.hostname, config.project]
    url.should eq(expected_site)
  end
end

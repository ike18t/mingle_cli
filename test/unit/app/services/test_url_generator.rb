require 'test_helper'

describe UrlGenerator do
  it 'should return formatted url' do
    config = Application::Config.new :username => 'username', :password => 'password', :hostname => 'hostname'
    Application::ConfigService.stubs(:get).returns(config)
    url = UrlGenerator.generate
    expected_site = UrlGenerator::SITE  % [config.username, config.password, config.hostname]
    assert_equal expected_site, url
  end
end

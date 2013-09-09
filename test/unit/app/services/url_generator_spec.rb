require_relative '../../../test_helper'

describe UrlGenerator do
  it 'return formatted url' do
    config = Application::Config.new :username => 'username', :password => 'password', :hostname => 'hostname'
    Application::ConfigService.stubs(:get).returns(config)
    url = UrlGenerator.generate
    expected_site = UrlGenerator::SITE  % [config.username, config.password, config.hostname]
    url.should eq(expected_site)
  end
end

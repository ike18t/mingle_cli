require_relative '../../../../test/test_helper'

describe Application::Config do
  it 'should update attributes with the values passed into initialize' do
    username = 'ike'
    password = 'password1'
    hostname = 'http://bah'
    config = Application::Config.new :username => username, :password => password, :hostname => hostname
    config.username.should eq(username)
    config.password.should eq(password)
    config.hostname.should eq(hostname)
  end

  it 'should have blank values if nothing passed in on intialization' do
    config = Application::Config.new
    config.username.should be_nil
    config.password.should be_nil
    config.hostname.should be_nil
  end
end

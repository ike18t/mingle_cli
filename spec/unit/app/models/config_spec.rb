require_relative '../../../test_helper'

describe Application::Config do
  it 'should update attributes with the values passed into initialize' do
    username, password, hostname, project = 'ike', 'password1', 'http://bah', 'ove'
    config = Application::Config.new :username => username, :password => password, :hostname => hostname, :project => project
    config.username.should eq(username)
    config.password.should eq(password)
    config.hostname.should eq(hostname)
    config.project.should eq(project)
  end

  it 'should have blank values if nothing passed in on intialization' do
    config = Application::Config.new
    config.username.should be_nil
    config.password.should be_nil
    config.hostname.should be_nil
    config.project.should be_nil
  end

  it 'should update password instance variable with the encrypted hash' do
    password = 'password1'
    config = Application::Config.new :password => password
    config.instance_variable_get('@password').should eq(AESCrypt.encrypt(password, Application::Config::PasswordKey))
  end
end

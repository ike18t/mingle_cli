require 'spec_helper'

describe AppConfig do
  it 'should update attributes with the values passed into initialize' do
    username, password, hostname, project = 'ike', 'password1', 'http://bah', 'ove'
    config = AppConfig.new :username => username, :password => password, :hostname => hostname, :project => project
    config.username.should eq(username)
    config.password.should eq(password)
    config.hostname.should eq(hostname)
    config.project.should eq(project)
  end

  it 'should have blank values if nothing passed in on intialization' do
    config = AppConfig.new
    config.username.should be_nil
    config.password.should be_nil
    config.hostname.should be_nil
    config.project.should be_nil
  end

  it 'should update password instance variable with the encrypted hash' do
    password = 'password1'
    config = AppConfig.new :password => password
    config.instance_variable_get('@password').should eq(AESCrypt.encrypt(password, AppConfig::PASSWORD_KEY))
  end
end

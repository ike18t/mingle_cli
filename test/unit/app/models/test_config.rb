require_relative '../../../../test/test_helper'

describe Application::Config do
  it 'should update attributes with the values passed into initialize' do
    username = 'ike'
    password = 'password1'
    hostname = 'http://bah'
    config = Application::Config.new :username => username, :password => password, :hostname => hostname
    assert_equal username, config.username
    assert_equal password, config.password
    assert_equal hostname, config.hostname
  end

  it 'should have blank values if nothing passed in on intialization' do
    config = Application::Config.new
    assert_equal nil, config.username
    assert_equal nil, config.password
    assert_equal nil, config.hostname
  end
end

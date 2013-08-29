require_relative '../../../test_helper'

describe Application::ConfigService do
  before do
    Application::ConfigService.stubs(:save)
    Application::ConfigService.stubs(:read).returns(Application::Config.new)
  end

  describe 'update' do
    it 'should update config model with hash values passed to update' do
      updates = {:username => 'ike'}
      Application::ConfigService.update updates
      config = Application::ConfigService.get
      assert_equal updates[:username], config.username
    end

    it 'should raise if passed an invalid param' do
      updates = {:username1 => 'ike'}
      assert_raises NoMethodError do
        Application::ConfigService.update updates
      end
    end
  end
end

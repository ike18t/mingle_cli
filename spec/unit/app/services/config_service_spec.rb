require_relative '../../../test_helper'

describe Application::ConfigService do
  before do
    Application::ConfigService.stubs(:save!)
    Application::ConfigService.stubs(:read).returns(Application::Config.new)
  end

  context 'update' do
    it 'should update config model with hash values passed to update' do
      updates = { :username => 'ike' }
      Application::ConfigService.update updates
      config = Application::ConfigService.get
      config.username.should eq(updates[:username])
    end

    it { expect { Application::ConfigService.update({ :username1 => 'ike' }) }.to raise_error(NoMethodError) }
  end
end

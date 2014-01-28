require 'spec_helper'

describe ConfigService do
  before do
    ConfigService.stubs(:save!)
    ConfigService.stubs(:read).returns(AppConfig.new)
  end

  context 'update' do
    it 'should update config model with hash values passed to update' do
      updates = { :username => 'ike' }
      ConfigService.update updates
      config = ConfigService.get
      config.username.should eq(updates[:username])
    end

    it { expect { ConfigService.update({ :username1 => 'ike' }) }.to raise_error(NoMethodError) }
  end
end

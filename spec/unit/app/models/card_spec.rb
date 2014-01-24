require_relative '../../../test_helper'

describe Card do
  before do
    @card = Card.find(19480)
  end

  context 'should pull properties' do
    it { @card.status.should eq('In Development') }
    it { @card.dev_pair.should eq('Homer/Bart') }

    it { Proc.new{@card.nonexistent_property }.should raise_error(NoMethodError) }
  end

  it { @card.id.should eq(19480) }
end

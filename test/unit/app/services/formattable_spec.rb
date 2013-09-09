require_relative '../../../test_helper'

describe Formattable do
  before do
    @card = Card.find 19480
    @card.extend Formattable
  end

  it 'should return the same string passed in if it contains no attributes' do
    @card.format('status').should eq('status')
  end

  it { @card.status.should eq(@card.format('[status]')) }

  it { @card.format('name is [name], status is [status]').should eq("name is #{@card.name}, status is #{@card.status}") }

  it 'should raise if format contains invalid attributes' do
    expect { @card.format('[bah] is invalid') }.to raise_error(NoMethodError)
  end

  it { @card.format('').should be_empty }

  it 'should return text "not set" if the property is nil' do
    @card.status = nil
    @card.format('[status]').should eq('not set')
  end
end

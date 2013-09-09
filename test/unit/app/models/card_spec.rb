require_relative '../../../test_helper'

describe Card do
  before do
    FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('test/19480.xml'))
    @card = Card.find(19480)
  end

  context 'should pull properties' do
    it 'should pull the status property for the card' do
      @card.status.should eq('In Development')
    end

    it 'should raise NoMethodError' do
      Proc.new{@card.bah}.should raise_error(NoMethodError)
    end
  end

  it 'should return card number as id' do
    @card.id.should eq(19480)
  end
end

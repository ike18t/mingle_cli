require_relative '../../../test_helper'

describe Card do
  before do
    FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('test/19480.xml'))
    @card = Card.find(19480)
  end

  describe 'should pull properties' do
    it 'should pull the status property for the card' do
      assert_equal 'In Development', @card.status
    end

    it 'should raise NoMethodError if property does not exist' do
      Proc.new{@card.bah}.must_raise NoMethodError
    end
  end

  it 'should return card number as id' do
    assert_equal 19480, @card.id
  end
end

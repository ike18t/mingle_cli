require_relative '../../../test_helper'

describe Card do
  describe 'should pull properties' do
    before do
      FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('test/19480.xml'))
      @card = Card.find(19480)
    end

    it 'should pull the status property for the card' do
      assert_equal 'In Development', @card.status
    end

    it 'should raise NoMethodError' do
      Proc.new{@card.bah}.must_raise NoMethodError
    end
  end
end

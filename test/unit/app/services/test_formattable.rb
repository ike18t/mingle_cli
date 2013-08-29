require_relative '../../../test_helper'

describe Formattable do
  before do
    @card = Card.find 19480
    @card.extend Formattable
  end

  it 'should return the same string passed in if it contains no attributes' do
    assert_equal 'status', @card.format('status')
  end

  it 'should replace string in braces with the attribute matching string' do
    assert_equal @card.status, @card.format('[status]')
  end

  it 'should replace multiple strings in braces with the attributes matching' do
    assert_equal "name is #{@card.name}, status is #{@card.status}", @card.format('name is [name], status is [status]')
  end

  it 'should raise if format contains invalid attributes' do
    Proc.new{@card.format('[bah] is invalid')}.must_raise NoMethodError
  end

  it 'should return default format if format is empty' do
    assert_empty @card.format('')
  end

  it 'should return text "not set" if the property is nil' do
    @card.status = nil
    assert_equal 'not set', @card.format('[status]')
  end
end

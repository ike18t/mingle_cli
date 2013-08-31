require_relative '../../../test_helper'

describe Comment do
  before do
    FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('test/19480.xml'))
    FakeWeb.register_uri(:get, %r|19480/comments.xml|, :body => File.read('test/19480_comments.xml'))
    @card = Card.find(19480)
    @comments = @card.comments
  end

  describe 'should pull attributes' do
    it 'should pull who created the comment from the attributes' do
      assert_equal 'Derek Johnston', @comments.first.created_by.name
    end

    it 'should raise NoMethodError if attribute does not exist' do
      Proc.new{@comments.first.bah}.must_raise NoMethodError
    end
  end

  it 'should sort comments by created_on date' do
    older = Comment.new
    older.created_at = Date.parse('2001-02-03')
    newer = Comment.new
    newer.created_at = Date.parse('2005-02-03')
    comments = [newer, older]
    assert_equal [older, newer], comments.sort
  end
end

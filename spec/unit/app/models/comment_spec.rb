require_relative '../../../test_helper'

describe Comment do
  before do
    @card = Card.find(19480)
    @comments = @card.comments
  end

  context 'should pull attributes' do
    it { @comments.first.created_by.name.should eq('Homer Simpson') }

    it { Proc.new{@comments.first.nonexistent_attribute}.should raise_error(NoMethodError) }
  end

  it 'should sort comments by created_on date' do
    older, newer = Comment.new, Comment.new
    older.created_at = Date.parse('2001-02-03')
    newer.created_at = Date.parse('2005-02-03')
    comments = [newer, older]
    comments.sort.should eq([older, newer])
  end
end

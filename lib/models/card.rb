class Card < MingleModel
  include Formattable
  extend MingleUnpagerizer

  has_many :comments

  def id
    self.number
  end
end

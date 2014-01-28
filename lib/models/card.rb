class Card < MingleModel
  include Formattable

  has_many :comments

  def id
    self.number
  end
end

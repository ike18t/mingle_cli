require_relative 'mingle_model'

class Card < MingleModel
  require_relative 'comment'
  require_relative '../services/formattable'

  include Formattable

  has_many :comments

  def id
    self.number
  end

end

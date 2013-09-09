require_relative 'mingle_model'
require_relative 'comment'
require_relative '../services/formattable'

class Card < MingleModel
  include Formattable

  has_many :comments

  def id
    self.number
  end

end

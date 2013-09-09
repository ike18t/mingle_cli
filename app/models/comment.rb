require_relative 'mingle_model'
require_relative 'card'

class Comment < MingleModel

  self.prefix = '/cards/:number/'

  def <=> next_up
   self.created_at <=> next_up.created_at
  end

end

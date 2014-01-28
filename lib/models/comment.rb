class Comment < MingleModel
  self.site = UrlGenerator.generate + '/cards/:card_id'

  def <=> next_up
   self.created_at <=> next_up.created_at
  end
end

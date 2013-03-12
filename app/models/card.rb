require 'active_resource'
require 'app/services/url_generator'

class Card < ActiveResource::Base
  self.format = :xml
  self.site = UrlGenerator.generate
end


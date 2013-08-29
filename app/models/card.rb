require 'active_resource'
require_relative '../services/url_generator'

class Card < ActiveResource::Base
  self.format = :xml
  self.site = UrlGenerator.generate
end


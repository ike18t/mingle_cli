require 'active_resource'
require_relative '../services/url_generator'
require_relative 'card'

class Comment < ActiveResource::Base
  self.format = :xml
  self.site = UrlGenerator.generate
  self.prefix = '/cards/:number/'

  def <=> next_up
   self.created_at <=> next_up.created_at
  end

  def method_missing method_name, *args
    super method_name, *args
  rescue NoMethodError
    attribute_matches = self.attributes.select{|attr| attr.name == method_name || attr.name.downcase == method_name.to_s.gsub('_', ' ')}
    raise if attribute_matches.empty?
    attribute_matches.first.value
  end

end

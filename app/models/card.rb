require 'active_resource'
require_relative '../services/url_generator'
require_relative 'comment'

class Card < ActiveResource::Base
  self.format = :xml
  self.site = UrlGenerator.generate

  has_many :comments

  def id
    self.number
  end

  def method_missing method_name, *args
    super method_name, *args
  rescue NoMethodError
    property_matches = self.properties.select{|prop| prop.name == method_name || prop.name.downcase == method_name.to_s.gsub('_', ' ')}
    raise if property_matches.empty?
    property_matches.first.value
  end

end

require 'active_resource'
require_relative '../services/url_generator'

class MingleModel < ActiveResource::Base

  self.format = :xml
  self.site = UrlGenerator.generate

  def method_missing method_name, *args
    super method_name, *args
  rescue NoMethodError
    match = get_attribute_value(method_name)
    match = get_property_value(method_name) if self.respond_to?(:properties) unless match

    raise if match.nil?
    match
  end

  def get_attribute_value name
    self.attributes[key_encode(name)]
  end

  def get_property_value name
    property = self.properties.select{ |prop| key_encode(prop.name) == key_encode(name) }.first
    property.value unless property.nil?
  end

  private
  def key_encode string
    string.downcase.to_s.gsub('_', ' ')
  end

end

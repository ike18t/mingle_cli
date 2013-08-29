require 'minitest/spec'
require 'mocha/setup'
require 'fakeweb'
require 'pry'

FakeWeb.register_uri(:get, %r|cards.xml|, :body => File.read('test/cards.xml'))
FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('test/19480.xml'))

files = Dir.glob('app/**/*.rb')
files.each{|file| puts file; require File.expand_path("#{file}"); }

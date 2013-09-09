require 'rspec'
require 'mocha/api'
require 'fakeweb'
require 'pry'

FakeWeb.register_uri(:get, %r|cards.xml|, :body => File.read('test/cards.xml'))
FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('test/19480.xml'))
FakeWeb.register_uri(:get, %r|19480/comments.xml|, :body => File.read('test/19480_comments.xml'))

files = Dir.glob('app/**/*.rb')
files.each{ |file| require File.expand_path("#{file}"); }

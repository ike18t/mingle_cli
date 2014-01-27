require 'rspec'
require 'mocha/api'
require 'fakeweb'
require 'pry'
require 'autotest'
require 'coveralls'

Coveralls.wear!

FakeWeb.register_uri(:get, %r|cards.xml|, :body => File.read('spec/fixtures/cards.xml'))
FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('spec/fixtures/19480.xml'))
FakeWeb.register_uri(:get, %r|19480/comments.xml|, :body => File.read('spec/fixtures/19480_comments.xml'))

files = Dir.glob('lib/**/*.rb')
files.each{ |file| require File.expand_path("#{file}"); }

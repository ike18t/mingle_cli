$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'mocha/api'
require 'pry'
require 'autotest'
require 'coveralls'
require 'fakeweb'
require 'mingle_cli'

Coveralls.wear!

FakeWeb.register_uri(:get, %r|cards.xml|, :body => File.read('spec/fixtures/cards.xml'))
FakeWeb.register_uri(:get, %r|19480.xml|, :body => File.read('spec/fixtures/19480.xml'))
FakeWeb.register_uri(:get, %r|19480/comments.xml|, :body => File.read('spec/fixtures/19480_comments.xml'))

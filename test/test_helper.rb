require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/setup'

Dir.glob('app/**/*.rb').each{|file| require file; }

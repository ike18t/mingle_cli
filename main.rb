#!/usr/bin/env ruby
require 'bundler/setup'
require 'main'
require_relative 'app/models/card'
require_relative 'app/services/config_service'
require_relative 'app/services/formattable'

Main {
  mode :config do
    option(:hostname) {
      argument :optional
      description 'Set the server hostname used to access mingle'
    }

    option(:username) {
      argument :optional
      description 'Set the username used to access mingle'
    }

    option(:password) {
      argument :optional
      description 'Set the password used to access mingle'
    }

    def run
      updated = params.select(&:given?)
      updated = updated.inject({}) do |result, p|
        result[p.name.to_sym] = p.value
        result
      end
      Application::ConfigService.update updated
    end

    mode :view do
      puts Application::ConfigService.get.inspect
      description 'Quick view of the current config'
    end
  end

  def run
    puts "default"
  end
}

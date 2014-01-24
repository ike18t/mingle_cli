#!/usr/bin/env ruby
require 'bundler/setup'
require 'main'

Main {
  mode :config do
    require_relative 'app/services/config_service'

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

    option(:project) {
      argument :optional
      description 'Set the project to use to access cards in mingle'
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

  mode :card do
    require_relative 'app/models/card'

    description 'Get card info'

    argument(:number) {
      argument :required
      cast :int
      description 'Number of the card to lookup.'
    }

    option(:format) {
      argument :required
      cast :string
      description 'Format of the response, enclose desired return properties in brackets.'
    }

    option(:comments) {
      description 'View comments for the given card number.'
    }

    def run
      card = Card.find(params[:number].value)
      if params[:format].given?
        puts card.format(params[:format].value)
      end
      if params[:comments].given?
        card.comments.sort.each{ |comment| puts "#{comment.created_at} #{comment.created_by.name}: #{comment.content}" }
      end
    end
  end

  mode :cards do
    require_relative 'app/models/card'

    description 'Get cards by filter'

    option(:where) {
      argument :required
      cast :string
      description 'The MQL style where filter.  Remember: Put quotes around values with spaces.'
    }

    option(:format) {
      argument :required
      cast :string
      description 'Format of the response, enclose desired return properties in brackets.'
    }

    def run
      where = params[:where].value
      cards = Card.find(:all, :params => { :filters => { :mql => where } } )
      if params[:format].given?
        cards.each do |card|
          puts card.format(params[:format].value)
        end
      end
    end
  end

  def run
    puts 'Please use a mode.  See help for more details'
  end
}

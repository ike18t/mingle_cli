#!/usr/bin/env ruby

require 'bundler/setup'
require 'mingle_cli'
require 'main'

module MingleCLI
  Main {
    mode :configure do
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
        ConfigService.update updated
      end

      mode :view do
        puts ConfigService.get.inspect
        description 'Quick view of the current config'
      end
    end

    mode :card do
      description 'Get card info'

      argument(:number) {
        argument :required
        cast :int
        description 'Number of the card to lookup.'
      }

      argument(:format) {
        argument :required
        cast :string
        description 'Format of the response, enclose desired return properties in brackets.'
      }

      option(:comments) {
        description 'View comments for the given card number.'
      }

      def run
        card = Card.find(params[:number].value)
        puts card.format(params[:format].value)
      end
    end

    mode :cards do
      description 'Get cards by filter'

      argument(:filter) {
        argument :required
        cast :string
        description 'MQL filter.  Example:  Status is "in development"'
      }

      argument(:format) {
        argument :required
        cast :string
        description 'Format of the response, enclose desired return properties in brackets.'
      }

      def run
        cards = Card.find(:all, :params => { :filters => { :mql => params[:filter].value } } )
        cards.each do |card|
          puts card.format(params[:format].value)
        end
      end
    end

    mode :comment do
      description 'Comment on a card.'

      argument(:number) {
        argument :required
        cast :int
        description 'Number of the card to leave a comment.'
      }

      argument(:comment) {
        argument :required
        cast :string
        description 'The comment body.'
      }

      def run
        Comment.create :card_id => params[:number].value, :content => params[:comment].value
      end
    end

    mode :comments do
      description 'Get comments for a card.'

      argument(:number) {
        argument :required
        cast :int
        description 'Number of the card to lookup.'
      }

      def run
        card = Card.find(params[:number].value)
        card.comments.sort.each do |comment|
          puts "#{comment.created_at} #{comment.created_by.name}: #{comment.content}"
        end
      end
    end

    def run
      puts 'Please use a mode.  See help for more details'
    end
  }
end

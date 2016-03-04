require 'net/http'
require 'uri'
require 'json'

module Ghq
  module Yaimport
    class RepositoryList
      def initialize(users)
        @users = users
      end

      def call
        repos = []
        @users.each do |u|
          uri = URI.parse("https://api.github.com/users/#{u}/repos")
          json = Net::HTTP.get(uri)
          result = JSON.parse(json)
          result.each do |e|
            repos << e["html_url"]
          end
        end
        repos
      end
    end
  end
end

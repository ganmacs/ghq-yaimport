require "ghq/yaimport/version"
require "ghq/yaimport/file_loader"
require "ghq/yaimport/repository_list"

module Ghq
  module Yaimport
    class CLI
      def call(args = ARGV)
        contents = if args.size == 1
                     file_loader.load(args.first)
                   else
                     file_loader.load
                   end

        repo = contents["repo"]
        user = contents["user"]
        repos = Ghq::Yaimport::RepositoryList.new(user).call

        repo.each do |e|
          repos << "https://github.com/#{e}"
        end

        if exist_ghq?
          repos.each { |x| system("ghq get #{x}") }
        else
          repos.each do |x|
            Thread.start { system("git clone #{x}") }
          end
        end
      end

      private

      def exist_ghq?
        `which ghq`
        $?
      end

      def file_loader
        @file_loader ||= Ghq::Yaimport::FileLoader.new
      end
    end
  end
end

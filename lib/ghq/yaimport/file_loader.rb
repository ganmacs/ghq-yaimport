require 'yaml'

module Ghq
  module Yaimport
    class FileLoader
      DEFAULT_FILE_PATH = ".ghq-yaimport".freeze
      ACCEPTABLE_EXTENSIONS = %w(.yml .yaml).freeze

      def load(file = nil)
        @file = file
        case
        when !exist_file?
          raise "Does not exist file #{file_path}"
        when invalid_extension_type?
          raise "Invalid extension"
        else
          file_load
        end
      end

      private

      def file_load
        YAML.load_file(file_path)
      end

      def invalid_extension_type?
        !ACCEPTABLE_EXTENSIONS.include?(File.extname(file_path))
      end

      def exist_file?
        File.exist?(file_path)
      end

      def file_path
        @file_path ||= @file || DEFAULT_FILE_PATH
      end
    end
  end
end

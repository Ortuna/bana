require 'pandoc-ruby'

module Bana
  module Converters
    class Md
      attr_reader :from, :to

      def initialize(from, to)
        @from   = from.respond_to?(:each) ? from : [from]
        @to     = to

        @from.each { |f| raise Bana::FileNotFound unless File.exists?(f) }
        convert
      end

      private
      def convert
        PandocRuby.new(read_files, from: 'markdown', output: to).convert
      end

      def read_files
        String.new.tap do |content|
          from.each { |f| content << File.read(f) << "\\newpage\n\n" }
        end
      end

    end#class
  end#module
end#module

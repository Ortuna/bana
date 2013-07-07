require 'yaml'

module Bana
  class Manifest
    attr_reader :path, :manifest

    ##
    # 
    # @options
    #  path - Path to the manifest yml file
    def initialize(path)
      check_existance(path)
      @path     = path
      @manifest = read_manifest
    end

    ##
    # returns the Human readable name of a file
    def [](file_path_key)
      @manifest[file_path_key]
    end

    ##
    # returns the full path on disk of the given file
    def full_path(file_name)
      full_path = File.expand_path("#{dirname}/#{file_name}")
      File.exists?(full_path) ? full_path : nil
    end

    ##
    # returns an array of full paths to each manifest file
    def files
      manifest.inject([]) do |memo, item|
        memo << full_path(item.first)
      end
    end

    private
    def dirname
      File.dirname(path)
    end

    def read_manifest
      load_yaml.tap { |h| raise Bana::InvalidManifest unless h.kind_of? Hash }
    end

    def load_yaml
      YAML.load File.read(@path)
    end

    def check_existance(path)
      return if File.exists?(path)
      raise Bana::FileNotFound, "Manifest #{path} not found"
    end

  end#class
end#module

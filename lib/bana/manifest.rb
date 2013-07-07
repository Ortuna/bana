require 'yaml'

module Bana
  class FileNotFound    < Exception; end
  class InvalidManifest < Exception; end

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

    private
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

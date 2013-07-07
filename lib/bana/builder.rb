module Bana
  class Builder
    attr_reader :path, :manifest_file

    def initialize(options = {})
      configure_builder default_options.merge(options)
      load_manifest
    end

    def create_pdf(output_path)
      Bana::Converters::Md.new(manifest_files, output_path)
    end

    private
    def load_manifest
      file_path = File.expand_path(path + '/' + manifest_file)
      @manifest = Bana::Manifest.new(file_path)
    end

    def default_options
      { manifest_file: 'manifest.yml' }
    end

    def manifest_files
      @manifest.files
    end

    ##
    # sets key/value pairs for each option
    # on the instance
    def configure_builder(options)
      options.each do |key, value|
        self.instance_variable_set "@#{key}", value if self.respond_to? key
      end
    end

  end #class
end #module

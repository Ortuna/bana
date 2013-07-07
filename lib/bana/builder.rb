module Bana
  class Builder
    attr_reader :path, :manifest

    def initialize(options = {})
      options = default_options.merge(options)
      configure_builder options
    end

    private

    def default_options
      {manifest: 'manifest.yml'}
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

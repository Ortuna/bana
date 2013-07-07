require 'grit'

module Bana
  class Git
    attr_reader :remote_path, :local_path

    def initialize(remote_path, local_path)
      @remote_path = remote_path
      @local_path  = local_path
    end

    ##
    # Clone the remote repo to the local_path
    def clone
      raise Bana::LocalRepoExists if File.exists?(local_path)
      Grit::Git.new(local_path).clone({}, remote_path, local_path)
      raise Bana::RemoteCloneFail unless File.exists?(local_path)
    end

  end
end

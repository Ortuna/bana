module Bana
  class Book

    attr_reader :remote_repo
    def initialize(remote_repo)
      @remote_repo = remote_repo
    end

    def git_to_pdf(output_file)
      clone_repo
      Bana::Builder.new(path: tmp_path).create_pdf(output_file)
      clean_up_repo tmp_path
    end

    private
    def tmp_path
      '/tmp/git_to_pdf'
    end

    def clone_repo
      Bana::Git.new(remote_repo, tmp_path).clone
    end

    def clean_up_repo(repo_path)
      FileUtils.rm_rf repo_path
    end

  end
end


module Bana
  class Book

    attr_reader :remote_repo
    def initialize(remote_repo)
      @remote_repo = remote_repo
    end

    def git_to_pdf(output_file)
      clone_repo
      Bana::Builder.new(path: tmp_path).create_pdf(output_file)
      clean_up_repo
    end

    private
    def tmp_path
      '/tmp/git_to_pdf'
    end

    def clone_repo
      Bana::Git.new(remote_repo, tmp_path).clone
    end

    def clean_up_repo
      FileUtils.rm_rf tmp_path
    end

  end
end


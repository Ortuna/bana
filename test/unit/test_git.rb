require 'helper'

class TestGit < MiniTest::Test

  def setup
    @remote_repo = 'git@github.com:Ortuna/ortuna-content.git'
    @tmp_path    = File.expand_path("../../tmp", __FILE__)
  end

  def teardown
    FileUtils.rm_rf @tmp_path
  end

  def test_clone_remote_repo
    repo = Bana::Git.new(@remote_repo, @tmp_path)
    repo.clone

    assert_equal true, File.exists?(@tmp_path)
  end

end

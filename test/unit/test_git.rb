require 'helper'

class TestGit < MiniTest::Test

  def setup
    @remote_repo = 'git@github.com:Ortuna/simple-book.git'
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

  def test_raise_when_local_path_present
    repo = Bana::Git.new(@remote_repo, @tmp_path)
    repo.clone
    assert_raises(Bana::LocalRepoExists) { repo.clone }
      end

  def test_invalid_remote_repo_error
    repo = Bana::Git.new('zyxzz', @tmp_path)
    assert_raises(Bana::RemoteCloneFail) { repo.clone }
  end

end

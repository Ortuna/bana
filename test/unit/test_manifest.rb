require 'helper'

class TestManifest < MiniTest::Test

  def setup
    @fixture_path  = File.expand_path("../../fixtures/simple", __FILE__)
    @manifest_path = File.expand_path("#{@fixture_path}/manifest.yml", __FILE__)
  end

  def test_raise_on_unkown_path
    path = File.expand_path("#{@fixture_path}/unkown_path.yml", __FILE__)
    assert_raises(Bana::FileNotFound) { Bana::Manifest.new(path) }
  end

  def test_no_raise_on_known_path
    Bana::Manifest.new(@manifest_path)
  end

  def test_can_query_manifest_path
    manifest = Bana::Manifest.new(@manifest_path)
    assert_equal @manifest_path, manifest.path
  end

  def test_can_query_manifest
    manifest = Bana::Manifest.new(@manifest_path)
    refute_nil manifest['toc.md']
  end

  def test_boom_on_invalid_manifest
    path = @fixture_path + "/invalid.yml"
    assert_raises(Bana::InvalidManifest) { Bana::Manifest.new(path) }
  end

  #private stuff delete if broken
  def test_load_yaml
    manifest = Bana::Manifest.new(@manifest_path)
    hash     = manifest.send(:load_yaml)
    assert_equal 'Table of contents', hash["toc.md"]
  end
end

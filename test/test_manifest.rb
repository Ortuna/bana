require 'helper'

class TestManifest < MiniTest::Unit::TestCase

  def test_raise_on_unkown_path
    path = File.expand_path("../fixtures/simple/unkown_path.yml", __FILE__)
    assert_raises(Bana::FileNotFound) { Bana::Manifest.new(path) }
  end

  def test_no_raise_on_known_path
    path = File.expand_path("../fixtures/simple/manifest.yml", __FILE__)
    Bana::Manifest.new(path)
  end

  def test_can_query_manifest_path
    path     = File.expand_path("../fixtures/simple/manifest.yml", __FILE__)
    manifest = Bana::Manifest.new(path)
    assert_equal(path, manifest.path)
  end

  def test_can_query_manifest
    path     = File.expand_path("../fixtures/simple/manifest.yml", __FILE__)
    manifest = Bana::Manifest.new(path)
    refute_nil manifest['toc.md']
  end

  def test_boom_on_invalid_manifest
    path     = File.expand_path("../fixtures/simple/invalid.yml", __FILE__)
    assert_raises(Bana::InvalidManifest) { Bana::Manifest.new(path) }
  end

  #private stuff delete if broken
  def test_load_yaml
    path     = File.expand_path("../fixtures/simple/manifest.yml", __FILE__)
    manifest = Bana::Manifest.new(path)
    hash     = manifest.send(:load_yaml)
    assert_equal 'Table of contents', hash["toc.md"]
  end
end

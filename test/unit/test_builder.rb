require 'helper'

class TestBuilder < MiniTest::Test

  def test_default_options
    builder = Bana::Builder.new(path: File.expand_path("../../fixtures/simple", __FILE__))
    assert_equal 'manifest.yml', builder.manifest_file
  end

  def test_options
    path    = File.expand_path("../../fixtures/simple", __FILE__)
    builder = Bana::Builder.new(path: path, manifest_file: 'another_manifest.yml')

    assert_equal File.expand_path("../../fixtures/simple", __FILE__), builder.path
    assert_equal 'another_manifest.yml', builder.manifest_file
  end

  #private stuff
  def test_manifest_files
    path    = File.expand_path("../../fixtures/simple", __FILE__)
    builder = Bana::Builder.new(path: path, manifest_file: 'manifest.yml')

    refute_equal nil, builder.send(:manifest_files)
    refute_equal [], builder.send(:manifest_files)
  end

end

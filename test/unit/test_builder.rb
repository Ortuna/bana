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

end

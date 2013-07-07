require 'helper'

class TestBuilder < MiniTest::Test

  def test_presence
    refute_equal nil, Bana::Builder.new 
  end

  def test_default_options
    builder = Bana::Builder.new({})
    assert_equal 'manifest.yml', builder.manifest_file
  end

  def test_options
    options = { path: '/some/path', manifest_file: 'my_manifest.yml' }
    builder = Bana::Builder.new(options)

    assert_equal '/some/path', builder.path
    assert_equal 'my_manifest.yml', builder.manifest_file
  end

end

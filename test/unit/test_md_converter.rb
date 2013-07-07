require 'helper'

class TestMdConverter < MiniTest::Test

  def setup
    @fixture_path  = File.expand_path("../../fixtures/simple", __FILE__)
    @tmp_path      = File.expand_path("../../tmp", __FILE__)

    FileUtils.mkdir_p @tmp_path
  end

  def teardown
    FileUtils.rm_rf @tmp_path
  end

  def test_file_existance
    assert_raises(Bana::FileNotFound) {
      md_converter = Bana::Converters::Md.new('unkown_path.md','output.md')
    }

    Bana::Converters::Md.new("#{@fixture_path}/toc.md","#{@tmp_path}/output.pdf")
  end

  def test_conversion_to_pdf
    Bana::Converters::Md.new("#{@fixture_path}/toc.md","#{@tmp_path}/output.pdf")
    assert_equal true, File.exists?("#{@tmp_path}/output.pdf")
  end

  def test_convert_multiple_md_files
    files = ["#{@fixture_path}/toc.md",
             "#{@fixture_path}/how_to.md"]
    Bana::Converters::Md.new(files,"#{@tmp_path}/output.pdf")
    assert_equal true, File.exists?("#{@tmp_path}/output.pdf")
  end

end

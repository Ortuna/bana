require 'helper'
require 'minitest/spec'

describe Bana::Builder do

  before :each do
    @path          = File.expand_path("../../fixtures/simple", __FILE__)
    @manifest_file = File.expand_path("#{@fixture_path}/manifest.yml", __FILE__)
    @tmp_path      = File.expand_path("../../tmp", __FILE__)

    FileUtils.mkdir_p @tmp_path
  end

  after :each do 
    FileUtils.rm_rf @tmp_path
  end

  it 'lists files from the manifest' do
    builder = Bana::Builder.new(path: @path, manifest_file: @manifest_file)
    builder.send(:manifest_files).count.must_be :>, 1
  end

  it 'creates a pdf from a given manifest' do
    builder = Bana::Builder.new(path: @path, manifest_file: @manifest_file)
    output_pdf_file = @tmp_path + "/book.pdf"
    builder.create_pdf(output_pdf_file)

    File.exists?(output_pdf_file).must_equal true
  end
end

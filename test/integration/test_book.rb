require 'helper'
require 'minitest/spec'

describe Bana::Book do

  before :each do 
    @remote_repo = 'git@github.com:Ortuna/simple-book.git'
    @tmp_path    = File.expand_path("../../tmp", __FILE__)
    @output      = "#{@tmp_path}/remote_file.pdf"

    FileUtils.mkdir_p @tmp_path
  end

  after :each do
    FileUtils.rm_rf @tmp_path
  end

  it 'can produce a book from a remote git repo' do
    Bana::Book.new(@remote_repo).git_to_pdf(@output)
    assert true, File.exists?(@output)
  end
end

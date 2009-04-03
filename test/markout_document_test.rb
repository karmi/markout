require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/document'

module Markout
  class DocumentTest < Test::Unit::TestCase

    def test_should_load_file
      assert_nothing_raised { new_valid_document }
    end

    def test_should_raise_exception_when_file_not_found
      assert_raise(FileNotFound) { @document = Document.new( "tmp/xxx/yyy/zzz/#{Time.now.to_i}" ) }
    end

    def test_should_set_paths
      new_valid_document
      assert_not_nil @document.path
      assert_equal File.join( File.expand_path(File.dirname(__FILE__)), '/fixtures/markdown.txt' ), @document.path
      assert_equal Pathname.new( File.expand_path(File.dirname(__FILE__)) + '/fixtures'), @document.base_path
    end

    def test_should_read_file_contents
      new_valid_document
      assert_not_nil @document.content
      assert_equal @document.content, fixture('markdown.txt')
    end

    def new_valid_document
      @document = Document.new( fixture_file('markdown.txt'), :history => false )
    end

  end
end

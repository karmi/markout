require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/output'
require 'tempfile'

module Markout
  class OutputTest < Test::Unit::TestCase

    def setup
      default_output
    end

    def test_default_initialization
      assert_nothing_raised { default_output }
      assert_not_nil @output.document
      assert_not_nil @output.format
      assert_not_nil @output.formatter
      assert_equal Markout::Html, @output.formatter.class
    end

    def test_export
      tmpfile = Tempfile.new('markout_test.html')
      tmpfile.puts @output.export
      tmpfile.close
      # Hats down to @kubicek for the "let's diff huge chunks of text in tests!" idea!!!
      diff = `diff -u #{File.expand_path(File.dirname(__FILE__))}/fixtures/markdown.html #{tmpfile.path}`
      assert diff.chomp == '', "Fixture HTML does not match Markout output, see diff below:\n" + diff
    end

    private

    def default_output
      @output = Output.new( fixture_file('markdown.txt'), :history => false )
    end

  end
end

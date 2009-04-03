require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/output'

module Markout
  class OutputTest < Test::Unit::TestCase

    def test_default_initialization
      assert_nothing_raised { default_output }
      assert_not_nil @output.document
      assert_not_nil @output.format
      assert_not_nil @output.formatter
      assert_equal Markout::Html, @output.formatter.class
    end

    def test_export
      default_output
      assert_equal fixture('markdown.html'), @output.export, "Exported text does not match output"
    end

    def test_export_to_file
      # TODO
    end

    def default_output
      @output = Output.new( fixture_file('markdown.txt'), :history => false )
    end

  end
end

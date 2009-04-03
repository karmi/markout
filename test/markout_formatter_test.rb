require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/formatter'

module Markout
  class FormatterTest < Test::Unit::TestCase

    def test_should_raise_exception
      @formatter = Formatter.new( Document.new( fixture_file('markdown.txt'), :history => false ) )
      assert_raise(NoMethodError) { @formatter.export }
    end

  end
end

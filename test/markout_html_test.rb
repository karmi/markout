require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/formatter'
require 'markout/formatters/html/html'

module Markout
  class HtmlTest < Test::Unit::TestCase

    def setup
      @document = Document.new( fixture_file('markdown.txt') )
    end

    def test_should_set_default_template
      @formatter = Html.new( @document )
      assert_equal 'default', @formatter.send(:template_name)
      assert File.exist?(@formatter.send(:template_path))
    end

    def test_should_set_template
      @formatter = Html.new( @document, :template => 'my_special_template' )
      assert_equal 'my_special_template', @formatter.send(:template_name)
    end

    def test_should_match_title
      @formatter = Html.new( @document )
      assert_equal 'Markdown', @formatter.send(:title)
    end

    def test_should_suck_in_images
      @formatter = Html.new( @document )
      assert @formatter.export =~ Regexp.new("<img src=\"data:image\/png;base64,#{Base64.encode64(fixture('mt_textformat_menu.png'))[0..20]}"), "Should read image contents into HTML"
    end

  end
end

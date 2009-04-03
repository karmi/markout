require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/document'
require 'markout/history'

module Markout
  class HistoryTest < Test::Unit::TestCase

    def test_should_initialize_with_repository
      assert_nothing_raised do
        @history = Markout::History.new( 
          Markout::Document.new(fixture_file('empty.txt'), :history => false), 
          :git_dir => fixtures_path.join('empty_repository__dot__git')
        )
      end
      assert_not_nil @history.repo
      assert_not_nil @history.revisions
    end

  end
end

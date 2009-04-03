require File.join(File.dirname(__FILE__), 'test_helper')
require 'markout/revision'
require 'ostruct'

module Markout
  class RevisionTest < Test::Unit::TestCase

    def test_should_initialize_with_commit
      assert_nothing_raised do
        @revision = Markout::Revision.new( fake_grit_commit )
      end
      assert_not_nil @revision.sha
      assert_not_nil @revision.date
      assert_not_nil @revision.author
      assert_not_nil @revision.subject
      assert_not_nil @revision.message
      assert_not_nil @revision.diff
    end

    private

    def fake_grit_commit
      diff=<<END
diff --git a/file.txt
index 0000000..11111111 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1,5 @@
# Header
+## Subheader
+Lorem ipsum dolor sit amet, consectetur adipisicing elit.+
+sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
+
END
      OpenStruct.new(
        :sha     => '0'*40,
        :date    => Time.now,
        :author  => 'John Git',
        :message => "Subject is on the first line\nAnd everything else is the message",
        :show     => [OpenStruct.new(:diff => diff)]
      )
    end

  end
end

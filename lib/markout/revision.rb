module Markout

  class Revision
    attr_reader :sha, :date, :author, :subject, :message, :diff
    def initialize(commit)
      @sha    = commit.sha
      @date   = commit.date
      @author = commit.author.to_s
      @subject, @message = parse_commit_message(commit)
      @diff   = commit.show.first.diff
    end

    private
    def parse_commit_message(commit)
      lines = commit.message.split("/n")
      [ lines.first, lines[1..commit.message.size].join("\n") ]
    end
  end

end

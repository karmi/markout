require 'rdiscount'
require 'cgi'

module Markout

  class Revision

    attr_reader :sha, :date, :author, :subject

    def initialize(repo, commit)
      @repo   = repo
      @sha    = commit.sha
      @date   = commit.date
      @author = commit.author.to_s
      @subject, @message = parse_commit_message(commit)
      @diff   = commit.show.first.diff || ''
    end

    def diff(options={})
      case options[:format]
        when 'raw'    then @diff
        when 'short'  then short_diff
        when 'inline' then inline_diff
        else @diff
      end
    end

    def message(options={})
      case options[:format]
      when :html
        return RDiscount.new( CGI::escapeHTML(@message) ).to_html
      else
        return @message
      end
    end

    private

    def parse_commit_message(commit)
      lines = commit.message.split("\n")
      [ lines.first, lines[1..commit.message.size].join("\n") ]
    end

    def short_diff
      @diff.gsub(/^\-\-\- a\/\S+\n+/, '').
            gsub(/^\+\+\+ b\/\S+\n+/, '').
            gsub(/^\-\-\- \/dev\/null\n+/, '').
            gsub(/^\+\+\+ \/dev\/null\n+/, '').
            gsub(/^@@ .+\n+/,   '')
    end

    def inline_diff
      # FIXME: Cleanup
      output  = %x[cd #{@repo.path} && git show --no-prefix --ignore-space-at-eol --color-words #{@sha} 2>&1]
      if $?.success?
        return convert_bash_color_codes( output.gsub(/(.*)@@(.*)/m, '\2') )
      else
        return short_diff
      end
    end

    # Lifted from Integrity (www.integrityapp.com), (c) foca & sr
    def convert_bash_color_codes(string)
      string.
        gsub(/\e\[31m([^\e]*)\e\[m/, '<del>\1</del>').
        gsub(/\e\[32m([^\e]*)\e\[m/, '<ins>\1</ins>').
        gsub("\e[m", '')
    end

  end

end

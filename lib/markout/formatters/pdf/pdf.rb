$KCODE = 'UTF-8'

require 'tempfile'
require File.join(File.dirname(__FILE__), '..', 'html', 'html.rb')

# Depends on HTMLDOC utility (http://www.easysw.com/htmldoc/)
module Markout

  class Pdf < Formatter

    def export
      `cat "#{tempfile.path}" | /opt/local/bin/htmldoc -t pdf \
          --bodyfont "Helvetica" --headfootfont "Helvetica" \
          --no-compression --color --embedfonts \
          --header "" --footer .1. --links --no-title \
          --toctitle "" --tocheader "..." --tocfooter "..." \
          -`
    end

    private

    def tempfile
      tempfile = Tempfile.new(File.basename(@document.path) + '.html')
      content  = Markout::Html.new(@document).export
      tempfile << content.gsub(/[^\x00-\x7F]/) { |ch| "&##{ch.unpack("U")[0]};" } # From the Textmate Markdown bundle
    end

  end

end

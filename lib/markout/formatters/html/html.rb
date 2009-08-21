require 'rdiscount'
require 'erb'
require 'base64'
require 'mime/types'
require 'cgi'

module Markout

  class Html < Formatter

    def export
      suck_in_images!
      ERB.new( File.read(template_path.join('content.rhtml')) ).result(binding)
    end

    private

    def template_name
      @options[:template] || 'default'
    end

    def template_path
      Pathname.new( File.join( File.dirname(__FILE__), 'templates', template_name ) )
    end

    def content
      @content ||= RDiscount.new( @document.content ).to_html
    end

    def screen_style
      File.read template_path.join('screen.css')
    end

    def print_style
      File.read template_path.join('print.css')
    end

    def syntax_highlighter
      s = ''
      s << '<script type="text/javascript">' + File.read( template_path.join('..', 'common', 'code_highlighter.js') ) + '</script>'
      s << '<script type="text/javascript">' + File.read( template_path.join('..', 'common', 'syntax_diff.js') )      + '</script>'
      s << '<style type="text/css" media="screen">' + File.read( template_path.join('..', 'common', 'code.css') ) + '</style>'
    end

    def jquery
      File.read( template_path.join('..', 'common', 'jquery-1.3.2.min.js') )
    end

    def application_js
      File.read( template_path.join('..', 'common', 'application.js') )
    end

    def title
      h1  = content.match(/<h1\s*.*>(.+)<\/h1>/)[1] rescue nil
      h1 || ''
    end

    def history
      @document.history
    end

    def h(html)
      CGI::escapeHTML(html.to_s)
    end

    private

    # TODO : Make 'alt' attribute optional
    # TODO : Cleanup?
    def suck_in_images!
      content.to_s.gsub!(/<img src="([^"]+)".*alt="([^"]+)".*\s*\/?>/) do |match|
        begin
          file = File.read( @document.base_path.join($1) )
          mime = MIME::Types.of(File.basename( @document.base_path.join($1) ))
          "<img src=\"data:#{mime};base64,#{Base64.encode64(file)}\" alt=\"#{$2}\" />"
        rescue
          # TODO : Better error handling
          puts "Error: Cannot load image #{$1}"
        end
      end
    end

  end

end

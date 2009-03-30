require 'pathname'

module Markout

  class Formatter

    def initialize(document, options={})
      @document = document
      @options  = options
      @format   = self.class.to_s.gsub(/^.*::/, '').downcase
    end

    def export
      raise NoMethodError, "Return String in `export()` method of your formatter (#{@format})"
    end

    def filename
      basename = File.basename(@document.path).split('.')
      ext = basename.pop
      "#{basename.join('.')}.#{@format}"
    end

  end

end

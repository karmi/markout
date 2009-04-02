require 'pathname'
require 'mime/types'

module Markout

  class Document

    attr_reader :path, :base_path, :content

    def initialize(path)
      @path      = File.expand_path(path)
      @base_path = Pathname.new( File.dirname(@path) )
      raise FileNotFound, "File #{@path} not found" unless File.exist?(@path)
      raise FileNotSupported, "File #{@path} is not plain text" unless MIME::Types.type_for(@path).any? { |type| type.media_type == 'text' }
      @content   = File.read(path)
    end

  end

end

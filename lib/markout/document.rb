require 'pathname'
require 'mime/types'

module Markout

  class Document

    attr_reader :path, :base_path, :content

    def initialize(path)
      @path      = File.expand_path(path)
      @base_path = Pathname.new( File.dirname(@path) )
      raise FileNotFound, "File #{@path} not found" unless File.exist?(@path)
      # TODO: Raise error for non-text file
      @content   = File.read(path)
    end

  end

end

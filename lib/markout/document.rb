require 'pathname'
require 'mime/types'

module Markout

  class Document

    attr_reader :path, :base_path, :filename, :content, :history

    def initialize(path, options={ :history => true })
      @path      = File.expand_path(path)
      @base_path = Pathname.new( File.dirname(@path) )
      @filename  = File.basename(path)
      @options   = options
      raise FileNotFound, "File #{@path} not found" unless File.exist?(@path)
      raise FileNotSupported, "File #{@path} is not plain text" unless MIME::Types.type_for(@path).any? { |type| type.media_type == 'text' }
      @content   = File.read(path)
      @history   = Markout::History.new(self, :git_dir => @options[:git_dir]) if @options[:history]
    end

  end

end

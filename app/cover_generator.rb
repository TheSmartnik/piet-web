require 'rack/app'

class CoverGenerator
  COVERS_PATH = "#{Rack::Directory.new('').root}/tmp/covers"
  SKETCHES_PATH = "#{Rack::Directory.new('').root}/sketches"
  DEFAULT_SKETCH = 'sketch'

  class Result < Struct.new(:success, :cover_path)
  end

  attr_reader :author, :title, :cover_name, :cover_path

  def initialize(title:, author:)
    @title = title
    @author = author
    @cover_name = "#{author} - #{title}"
    @cover_path = "#{COVERS_PATH}/#{cover_name}.png"
  end

  def call
    `processing-java --sketch=#{SKETCHES_PATH}/#{DEFAULT_SKETCH} --run author='#{author}' title='#{title}' cover='#{COVERS_PATH}/#{cover_name}'`
    Result.new(true, cover_path)
  end
end

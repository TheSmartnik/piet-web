require 'rack/app'

class CoverGenerator
  TMP_PATH = "#{Rack::Directory.new('').root}/tmp"
  SKETCHES_PATH = "#{Rack::Directory.new('').root}/sketches"
  DEFAULT_SKETCH = 'sketch'

  attr_reader :author, :title, :cover_name, :cover_path

  def initialize(title:, author:)
    @title = title
    @author = author
    @cover_name = "#{author} - #{title}"
    @cover_path = "#{TMP_PATH}/#{cover_name}.png"
  end

  def call
    `xvfb-run processing-java --sketch=#{SKETCHES_PATH}/#{DEFAULT_SKETCH} --run author='#{author}' title='#{title}' cover='#{TMP_PATH}/#{cover_name}'`
    self
  end
end

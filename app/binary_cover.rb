require_relative 'cover_generator'

class BinaryCover
  attr_reader :author, :title

  def initialize(title:, author:)
    @title = title
    @author = author
  end

  def call
    result = CoverGenerator.new(title: title, author: author).call
    binary = File.open(result.cover_path, 'rb') { |f| f.read }
    File.delete(result.cover_path)
    binary
  end
end

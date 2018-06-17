require_relative 'cover_generator'
require 'csv'

class BatchGeneration
  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    author_title_pairs = CSV.new(csv_file, headers: true).map(&:fields)

    author_title_pairs.each do |author, title|
      CoverGenerator.new(title: title, author: author).call
    end
  end
end

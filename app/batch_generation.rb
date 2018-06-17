require_relative 'cover_generator'
require 'csv'
require 'zip'
require 'securerandom'
require 'rack/app'


class BatchGeneration
  class BatchResult
    include Enumerable
    BATCHES_PATH = "#{Rack::Directory.new('').root}/tmp/batches"

    def initialize(members)
      @members = members
    end

    def each
      return enum_for(:each) unless block_given?

      @members.each { |member| yield(member) }
    end

    def archive
      zipfile_path = "#{BATCHES_PATH}/#{SecureRandom.hex}.zip"

      Zip::File.open(zipfile_path, Zip::File::CREATE) do |zipfile|
        self.each do |generator|
          zipfile.add(generator.cover_name, generator.cover_path)
        end
      end

      zipfile_path
    end
  end

  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    author_title_pairs = CSV.new(csv_file, headers: true).map(&:fields)

    results = author_title_pairs.map do |author, title|
      CoverGenerator.new(title: title, author: author).call
    end

    BatchResult.new(results)
  end
end

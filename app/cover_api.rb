require 'rack/app'
require_relative 'binary_cover'

class CoverApi < Rack::App

  # TODO: Make method idempotent
  desc 'Get cover for book'
  validate_params do
    required 'title', class: String, desc: 'Book Title'
    required 'author', class: String, desc: 'Book Author'
    optional 'regenerate', class: :boolean, desc: "Regenerate cover, when previous wan't good enough"
  end

  get '/cover' do
    BinaryCover.new(title: params['title'], author: params['author']).call
  end
end

require 'rack/app'

class App < Rack::App

  # TODO: Make method idempotent
  desc 'Get cover for book'
  validate_params do
    required 'title', class: String, desc: 'Book Title'
    required 'author', class: String, desc: 'Book Author'
    optional 'regenerate', class: :boolean, desc: "Regenerate cover, when previous wan't good enough"
  end

  get '/cover' do
    serve_file 'cover.png'
  end
end

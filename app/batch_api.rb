require 'rack/app'
require 'rack/app/front_end'
require 'hanami/helpers'
require_relative 'batch_generation'

class BatchApi < Rack::App
  apply_extensions :front_end

  Rack::App::FrontEnd::Helpers.include Hanami::Helpers

  helpers do
    def params
      {}
    end
  end


  desc 'Show batch form'
  get '/batch' do
    response['headers'] = 'Content-Type=text/html'
    render 'batch.html.erb'
  end

  desc 'Create zip with covers from csv'
  post '/batch' do
    binding.pry
    params = Rack::Multipart.extract_multipart request
    csv_file = params['batch']['csv_file']
    return if csv_file[:type] != 'text/csv'
    result = BatchGeneration.new(csv_file[:tempfile]).call
    serve_file result.archive
  end
end

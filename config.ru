require 'rack/app'
require_relative 'app/cover_api'
require_relative 'app/batch_api'

class App < Rack::App
  mount CoverApi
  mount BatchApi
end

run App

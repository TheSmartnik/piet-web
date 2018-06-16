require 'rack/app'
require_relative 'app/cover_api'

class App < Rack::App
  mount CoverApi
end

run App

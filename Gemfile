# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'rack-app'
gem 'rack-app-front_end'
gem 'rubyzip'
gem 'hanami-helpers'

group :production do
  gem 'unicorn'
end

group :development do
  gem "capistrano", "~> 3.11", require: false
  gem 'capistrano-unicorn-nginx', '~> 4.1.0'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.3'
end

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-rainbow'
end


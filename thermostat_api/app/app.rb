ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './data_mapper_setup'

class Thermostat < Sinatra::Base

  set :public_folder, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    erb :layout
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

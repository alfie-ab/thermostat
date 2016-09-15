ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/thermostat.rb'
require 'json'

class App < Sinatra::Base

  set :public_folder, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    erb :index
  end

  get '/thermostat' do
    temperature = Thermostat.last
    {temperature: thermostat.temperature, powermode: thermostat.powerMode}
  end

  post '/thermostat' do
    thermostat = Thermostat.create(temperature: params[:temperature], powermode: params[:powermode])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

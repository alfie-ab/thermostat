require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'app/models/thermostat'

DataMapper.setup(:default, "postgres://localhost/thermostat_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!

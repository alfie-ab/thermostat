require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative '../data_mapper_setup'

class Thermostat

  include DataMapper::Resource

  property :id, Serial
  property :temperature, Integer

end

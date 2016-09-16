require "data_mapper"
require "dm-postgres-adapter"

class Thermostat

  include DataMapper::Resource

  property :id,   Serial
  property :temp, Integer
  property :powermode, String

end

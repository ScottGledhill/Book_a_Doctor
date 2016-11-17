require 'data_mapper'
require 'dm-postgres-adapter'

class DoctorTimes
  include DataMapper::Resource
    property :time , String
    property :availability , Boolean
    property :slot_size, Integer
    property :doctor_id, Integer
end

DataMapper.setup(:default, "postgres://localhost/doctor_availability")
DataMapper.finalize

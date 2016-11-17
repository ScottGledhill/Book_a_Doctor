require 'data_mapper'
require 'dm-postgres-adapter'

class DoctorAvailablity
  include DataMapper::Resource
    property :id , Serial
    property :time , String
    property :availability , Boolean
    property :slot_size, Integer
    property :doctor_id, Integer
end

DataMapper.setup(:default, "postgres://localhost/doctor_availability")
DataMapper.finalize
DataMapper.auto_migrate!

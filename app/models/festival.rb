class Festival
  include Mongoid::Document

  field :name, type: String
  field :type, type: String
  field :fest_date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time
  field :neighborhood, type: String
  field :details, type: String
  field :address, type: String
  field :latitude, type: String
  field :longitude, type: String

  belongs_to :neighborhood

end

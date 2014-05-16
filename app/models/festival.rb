class Festival

  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :type, type: String
  field :fest_date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time
  field :details, type: String
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :coordinates, type: Array

  def address
    self.street + " " + self.city + " " + self.state + " " + self.zip
  end 

  # validates_presence_of :name, :type, :fest_date, :start_time, :end_time, :neighborhood, :street, :city, :state, :zip, message: "Please complete the form"

  geocoded_by :address
  after_validation :geocode

  belongs_to :neighborhood
  belongs_to :location

end

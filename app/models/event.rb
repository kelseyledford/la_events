class Event
 
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :event_date, type: Date
  field :price, type: String
  field :start_time, type: Time
  field :end_time, type: Time
  field :details, type: String
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :coordinates, type: Array
  field :updated_by_id, type: String
  field :created_by_id, type: String

  validates_length_of :name, minimum: 4, message: "Please enter a valid event name"
  validates_presence_of :price, message: "Please enter a price (e.g. free, $10.00)"
  validates_length_of :street, minimum: 5, message: "Please enter a valid street address"
  validates_presence_of :city, message: "Please enter a city"
  validates_length_of :state, is: 2, message: "Please enter a valid state"
  validates :zip, length: { is: 5, message: "Zipcode is too short" }, numericality: { only_integer: true, message: "Please enter a valid zip code" }

  def address
    self.street + " " + self.city + " " + self.state + " " + self.zip
  end 

  geocoded_by :address
  after_validation :geocode

  belongs_to :neighborhood
  belongs_to :location

end
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

  validates_presence_of :name, :type, :street, :city, :state, :zip

  validates :name, length: { minimum: 5 }
  validates :street, length: { minimum: 5}
  validates :state, length: { is: 2 }
  validates :zip, length: { is: 5 }, numericality: { only_integer: true }

  def address
    self.street + " " + self.city + " " + self.state + " " + self.zip
  end 

  


  geocoded_by :address
  after_validation :geocode

  belongs_to :neighborhood
  belongs_to :location

end

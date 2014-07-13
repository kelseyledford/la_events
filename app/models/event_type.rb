class EventType

  include Mongoid::Document

  field :name, type: String

  has_many :events

end

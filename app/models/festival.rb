class Festival
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :date, type: String
  field :time, type: String
  field :neighborhood, type: String
  field :details, type: String
end

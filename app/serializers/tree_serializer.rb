class TreeSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description

  has_many :harvest_sites
  has_many :locations, through: :harvest_sites
end

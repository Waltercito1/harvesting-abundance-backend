class LocationSerializer
  include JSONAPI::Serializer

  attributes :id, :latitude, :longitude, :harvest_sites, :trees, through: :harvest_sites

  # has_many :harvest_sites
  # has_many :trees, through: :harvest_sites
end

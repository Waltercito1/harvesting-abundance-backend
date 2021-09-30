class LocationSerializer
  include JSONAPI::Serializer

  attributes :id, :latitude, :longitude, :harvest_sites, :trees, through: :harvest_sites

end

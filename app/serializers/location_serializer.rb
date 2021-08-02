class LocationSerializer
  include JSONAPI::Serializer

  attributes :id, :latitude, :longitude
end

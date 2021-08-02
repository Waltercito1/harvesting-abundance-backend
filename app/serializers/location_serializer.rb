class LocationSerializer # < ActiveModel::Serializer
  include JSONAPI::Serializer

  attributes :id, :latitude, :longitude
end

class TreeSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description
end

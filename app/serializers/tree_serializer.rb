class TreeSerializer # < ActiveModel::Serializer
  include JSONAPI::Serializer

  attributes :id, :type, :description
end

class ReviewSerializer # < ActiveModel::Serializer
  include JSONAPI::Serializer

  attributes :id, :title, :content
  has_one :harvest_site
end

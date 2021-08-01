class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :harvest_site
end

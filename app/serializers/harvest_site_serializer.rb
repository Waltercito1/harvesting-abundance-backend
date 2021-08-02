class HarvestSiteSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  
  attributes :id
  has_one :tree
  has_one :location
end

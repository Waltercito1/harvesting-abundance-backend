class HarvestSiteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :tree
  has_one :location
end

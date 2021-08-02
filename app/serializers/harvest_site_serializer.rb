class HarvestSiteSerializer
  include JSONAPI::Serializer

  attributes :id, :created_at, :tree, :location

  belongs_to :tree
  belongs_to :location
  has_many :reviews
end

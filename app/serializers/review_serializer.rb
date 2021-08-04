class ReviewSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :content, :harvest_site

  # has_one :harvest_site
end

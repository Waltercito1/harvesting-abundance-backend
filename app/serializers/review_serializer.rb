class ReviewSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :content, :harvest_site

end

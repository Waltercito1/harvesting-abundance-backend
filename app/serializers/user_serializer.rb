class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :username, :email, :harvest_sites, :reviews, :reviewed_harvest_sites

end

class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :username, :email, :password_digest, :harvest_sites, :reviews, :reviewed_harvest_sites, through: :reviews, source: :user

  # has_one_attached :avatar
  # has_many :reviews
  # has_many :reviewed_harvest_sites, through: :reviews, source: :user

  # has_many :harvest_sites
end

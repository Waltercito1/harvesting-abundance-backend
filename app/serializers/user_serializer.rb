class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :username, :email, :password_digest
end

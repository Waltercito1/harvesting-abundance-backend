class User < ApplicationRecord
    has_secure_password
    
    has_one_attached :avatar
    has_many :reviews
    has_many :reviewed_harvest_sites, through: :reviews, source: :user

    has_many :harvest_sites

    validates :first_name,  presence: true
    validates :last_name,  presence: true
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}

    validate :allowed_avatar_image

    def allowed_avatar_image
        return unless avatar.attached?
      
        unless avatar.byte_size <= 1.megabyte
          errors.add(:avatar, "is too big")
        end

        accepted_types = ["image/jpeg", "image/png"]
        unless accepted_types.include?(avatar.content_type)
            errors.add(:avatar, "must be a JPEG or PNG")
        end
    end

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end

end

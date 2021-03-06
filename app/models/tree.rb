class Tree < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_many :harvest_sites, dependent: :destroy
    has_many :locations, through: :harvest_sites
    has_many :users, through: :harvest_sites

    has_one_attached :main_image

    validates :name, presence: true
    
    accepts_nested_attributes_for :locations
    accepts_nested_attributes_for :harvest_sites

    validate :allowed_image

    def allowed_image
        return unless main_image.attached?
      
        unless main_image.byte_size <= 1.megabyte
          errors.add(:main_image, "is too big")
        end

        accepted_types = ["image/jpeg", "image/png"]
        unless accepted_types.include?(main_image.content_type)
            errors.add(:main_image, "must be a JPEG or PNG")
        end
    end

    def image_url
        url_for(self.main_image)
    end

end

class Tree < ApplicationRecord
    has_many :harvest_sites
    has_many :locations, through: :harvest_sites

    has_one_attached :main_image

    validate :allowed_image

    accepts_nested_attributes_for :locations
    accepts_nested_attributes_for :harvest_sites

    def allowed_image
        return unless main_image.attached?
      
        unless main_image.byte_size <= 5.megabyte
          errors.add(:main_image, "is too big")
        end

        accepted_types = ["image/jpeg", "image/png"]
        unless accepted_types.include?(main_image.content_type)
            errors.add(:main_image, "must be a JPEG or PNG")
        end
    end

end

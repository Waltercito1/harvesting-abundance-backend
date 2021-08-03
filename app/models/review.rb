class Review < ApplicationRecord
  belongs_to :harvest_site
  belongs_to :user
end

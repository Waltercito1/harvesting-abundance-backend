class HarvestSite < ApplicationRecord
  belongs_to :tree
  belongs_to :location
  belongs_to :user

  has_many :reviews
end

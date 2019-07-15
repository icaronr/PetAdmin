class Product < ApplicationRecord
  # fae stuff
  include Fae::BaseModelConcern
  has_fae_image :hero_image

  def fae_display_field
    title
  end

  # relations
  belongs_to :supplier

  # validations
  validates :title, uniqueness: true, presence: true
  validates :price, presence: true
end

class Discount < ApplicationRecord
  # fae stuff
  include Fae::BaseModelConcern
  def fae_display_field
    title
  end

  # validations
  validates :title, uniqueness: true, presence: true
  validates :value, uniqueness: true, presence: true
end

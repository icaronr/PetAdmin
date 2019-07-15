class Campaign < ApplicationRecord
  # fae stuff
  include Fae::BaseModelConcern
  def fae_display_field
    title
  end

  # validations
  validates :title, presence: true
  validates :body, presence: true
end

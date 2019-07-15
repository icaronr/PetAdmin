class Client < ApplicationRecord
  # fae stuff
  include Fae::BaseModelConcern
  def fae_display_field
    name
  end

  # validations
  validates :phone, presence: true
  validates :email,
    uniqueness: true,
    presence: true,
    format: {
      with: Fae.validation_helpers.email_regex,
      message: 'You need use a valid and unique email'
    }
end

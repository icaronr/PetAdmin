class Client < ApplicationRecord
  # fae stuff
  include Fae::BaseModelConcern
  def fae_display_field
    name
  end

  #relations 
  has_many :campaign_clients, dependent: :destroy
  has_many :campaigns, through: :campaign_clients
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

class Campaign < ApplicationRecord
  # fae stuff
  include Fae::BaseModelConcern
  def fae_display_field
    title
  end

  # relations
  has_many :campaign_clients, dependent: :destroy
  has_many :clients, through: :campaign_clients
  
  # validations
  validates :title, presence: true
  validates :body, presence: true
end

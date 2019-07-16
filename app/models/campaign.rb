class Campaign < ApplicationRecord
  include Fae::BaseModelConcern
  
  # relations
  has_many :campaign_clients, dependent: :destroy
  has_many :clients, through: :campaign_clients
  
  # validations
  validates :title, presence: true
  validates :body, presence: true

  after_save :schedule_emails

  def schedule_emails
    Client.all.each do |client|
      CampaignClient.create(campaign: self, client: client)
      CampaingJob.perform_later client, self.title, self.body
    end
  end
  
  def fae_display_field
    title
  end
end

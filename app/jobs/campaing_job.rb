class CampaingJob < ApplicationJob
  queue_as :emails

  def perform(client, title, body)
    MarketingMailer.campaing(client, title, body).deliver_now
  end
end

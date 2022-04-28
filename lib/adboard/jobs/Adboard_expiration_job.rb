module Adboard::Jobs
  class AdboardExpirationJob
    def perform(adboard_id)
      ad = Adboard.find(adboard_id)
      ad.delete
      # taking next highest cost ad from db and making active
      next_ad = Adboard.where(price: Adboard.maximum("price"), status: "inactive").first
      next_ad.update(status: "active")
      # Next expiration run for current ad
      ad_expiration_job = Adboard::Jobs::AdboardExpirationJob.new
      ad_expiration_job.delay(run_at: next_ad.created_at + "#{next_ad.time_in_hours}".to_i.hours, queue: "adboard_expiration").perform(next_ad.id)
    end
  end
end

class AdViewController < ApplicationController
  def index
    @ad_view = Adboard.where(status: "active").first
  end
end

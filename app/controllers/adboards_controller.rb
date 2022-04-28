class AdboardsController < ApplicationController

  def create
    ad_params = params[:adboard]
    @adboard = Adboard.create(title: ad_params[:title], size_n: ad_params[:size_n], size_m: ad_params[:size_m], color: ad_params[:color], time_in_hours: ad_params[:time_in_hours])
    @cost = calcualte_price
    if Adboard.all.count == 1
      @adboard.update(price: @cost, status: "active")
      ad_expiration_job = Adboard::Jobs::AdboardExpirationJob.new
      ad_expiration_job.delay(run_at: @adboard.created_at + "#{@adboard.time_in_hours}".to_i.hours, queue: "adboard_expiration").perform(@adboard.id)
    else
      @adboard.update(price: @cost, status: "inactive")
    end
    redirect_to adboards_path(cost: @cost)
  end

  def new
    @user = User.find(session[:user_id])
    @adboard = Adboard.new
  end

  def index
    @cost = params[:cost] if params[:cost].present?
    @adboards = Adboard.all
  end

  private

   def calcualte_price
      total_price, mprice, nprice, color_price, time_price  = 0,0,0,0,0
      mprice = price_for_msize(@adboard.size_m) if @adboard.size_m.present?
      nprice = price_for_nsize(@adboard.size_n) if @adboard.size_n.present?
      color_price = price_for_color(@adboard.color) if @adboard.color.present?
      time_price = price_for_time(@adboard.time_in_hours) if @adboard.time_in_hours.present?
      total_price = total_price.to_i + mprice.to_i + nprice.to_i + color_price.to_i + time_price.to_i
   end

   def price_for_msize(ms)
     Constants::Adboard::SIZE_M * ms
   end

   def price_for_nsize(ns)
     Constants::Adboard::SIZE_M * ns
   end

   def price_for_color(color)
     if color = "White"
       Constants::Adboard::WHITE
     elsif color = "Black"
       Constants::Adboard::BLACK
     elsif color = "Flashy"
       Constants::Adboard::FLASHY
     elsif color = "Color"
       Constants::Adboard::COLOR
     end
   end

   def price_for_time(time)
     Constants::Adboard::HOUR_COST.to_i * time
   end
end

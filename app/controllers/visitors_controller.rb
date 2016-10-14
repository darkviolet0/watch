class VisitorsController < ApplicationController
before_action :set_theme, only: [:show]

  def new
    @visitor = Visitor.new
    @themes = Theme.all
    @client = Twitter::REST::Client.new do |config|
                config.consumer_key        = ENV["CONSUMER_KEY"]
                config.consumer_secret     = ENV["CONSUMER_SECRET"]
                config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
                config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end

  def subscribe
      
      
#      if (@mail($to, $ccr_subject, $ccr_message, $headers))
#        puts 'sent'
#      else
#        puts 'failed'
#      end

  end

   def contact
        # Tell the UserMailer to send a contact email 
        @name = params[:name]
        UserMailer.contact_email(params[:email], params[:name], params[:message]).deliver_now
        respond_to do |format|
          format.js
        end
  end



  private

  def secure_params
    params.require(:visitor).permit(:email)
  end



end

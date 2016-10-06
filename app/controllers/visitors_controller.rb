class VisitorsController < ApplicationController
before_action :set_theme, only: [:show]

  def new
    @visitor = Visitor.new
    @themes = Theme.all
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
      subject = '<watch> Contact sur le site'; 
      to = "fabrice@watch.coop";  

      headers  = 'MIME-Version: 1.0' + "\r\n";
      headers << "From: " + params[:email] + "\r\n"; 
      headers << 'Content-type: text/html; charset=iso-8859-1' + "\r\n";

      message = 'Name: ' + params[:name] + "<br>";
      message << params[:message];

      respond_to do |format|
        format.js
       end  
      
#      if (@mail($to, $ccr_subject, $ccr_message, $headers))
#        puts 'sent'
#      else
#        puts 'failed'
#      end

  end



  private

  def secure_params
    params.require(:visitor).permit(:email)
  end



end

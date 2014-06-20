class HomeController < ApplicationController
  def index

  	if current_user.has_role? :admin1ernivel
  		@requests = Request.where(level: 1)
  	elsif current_user.has_role? :admin2donivel
  		@requests = Request.where(level: 2)
  	elsif current_user.has_role? :admin
  		@requests = Request.all
  	elsif current_user.has_role? :requester
  		@requests = Request.where(user_id: current_user)
  	else 
  		flash[:error] = "No tienes permiso para ver este recurso"
  		redirect_to root_url
  	end
    @request_aproved=0
    @request_rejected=0
    @request_ended=0
    @request_n_esta=0
    @requests.each do |request|
      if request.status == "Aprobado"
        @request_aproved=+1
      elsif request.status == "Rechazado"
        @request_rejected=+1
      elsif request.status == "Terminado"
        @request_ended=+1
      else
        @request_n_esta=+1
      end
    end  	
  end
end

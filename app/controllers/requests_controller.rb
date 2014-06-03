class RequestsController < ApplicationController
  load_and_authorize_resource  
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.assign_attributes(user_id: current_user.id, status: 'Pendiente')
    if @request.save 
      flash[:notice] = "Se ha guardado correctamente"
      redirect_to requests_path
    else
      render action: 'new'
    end 
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])

    if params[:request][:status] == 'Aprobar'
      params[:request][:status] = "Aprobado"
    else
       params[:request][:status] = "Rechazado"
       params[:request][:level] = nil
       params[:request][:priority] = nil
    end

    
    if @request.update_attributes(request_params)
        flash[:notice] = "Se ha modificado correctamente"
        redirect_to @request
    end
  end

   def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end

  def index
    @request = Request.all
  end

  def refer

  end

  def request_params
    params.require(:request).permit(:user_id, :date_hour, :subject, :description, :status, :priority, :level)
  end

end

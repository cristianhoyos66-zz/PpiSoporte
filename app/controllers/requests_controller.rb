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
      Request.create_case_confirmation @request
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
    elsif params[:request][:status] == 'Rechazar'
       params[:request][:status] = "Rechazado"
        params[:request][:level] = nil
        params[:request][:priority] = nil
    else
      params[:request][:status] = "Terminado"
      params[:request][:level] = nil
      params[:request][:priority] = nil
    end


    
    if @request.update_attributes(request_params)
        flash[:notice] = "Se ha modificado correctamente"
        Request.update_case_confirmation @request
        redirect_to @request
    end

   def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end

  def index
    level = params[:level] 
    level_int = level.to_i
    case  level_int
      when 1
        if current_user.has_role? :admin1ernivel or current_user.has_role? :admin      
          @request = Request.where(level: 1) 
        else
          flash[:error] = "No tienes permiso para ver este recurso"
          redirect_to root_url
        end
      when 2
      if current_user.has_role? :admin2donivel or current_user.has_role? :admin     
        @request = Request.where(level: 2)
      else
          flash[:error] = "No tienes permiso para ver este recurso"
          redirect_to root_url
        end
      when 3
        unless (current_user.has_role? :admin1ernivel or current_user.has_role? :admin2donivel or current_user.has_role? :admin)
          @request = Request.where(user_id: current_user)
        else
          flash[:error] = "No tienes permiso para ver este recurso"
          redirect_to root_url
        end 
      else 
        if current_user.has_role? :admin    
          @request = Request.all
        else
          flash[:error] = "No tienes permiso para ver este recurso"
          redirect_to root_url
        end
    end   
  end

  def refer

  end

  def request_params
    params.require(:request).permit(:user_id, :date_hour, :subject, :description, :status, :priority, :level)
  end

end

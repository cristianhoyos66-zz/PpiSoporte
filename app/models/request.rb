class Request < ActiveRecord::Base
	belongs_to :users
 
	validates :subject, :presence => {message: 'Obligatorio'} 
	validates :description, :presence => {message: 'Obligatorio'}  

	def self.create_case_confirmation(request)
		user = User.find(request.user_id).email
    RequestMailer.create_case_confirmation(request, user).deliver
  end

  def self.update_case_confirmation(request)
		user = User.find(request.user_id).email
    RequestMailer.update_case_confirmation(request, user).deliver
  end

end

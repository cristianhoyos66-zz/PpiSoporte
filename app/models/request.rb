class Request < ActiveRecord::Base
	belongs_to :users
 
	validates :subject, :presence => {message: 'Obligatorio'} 
	validates :description, :presence => {message: 'Obligatorio'}  
end

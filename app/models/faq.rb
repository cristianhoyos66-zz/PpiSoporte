class Faq < ActiveRecord::Base
	validates :answer,  :presence => {message: 'Obligatorio'}
	validates :question, :presence => {message: 'Obligatorio'}
end

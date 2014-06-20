# encoding: utf-8
class RequestMailer < ActionMailer::Base
	default from: "ppisoporte@gmail.com"

	def create_case_confirmation(request, user)
		@request = request
		mail :to => user, :subject => "Creación caso en mesa de ayuda"
	end	

	def update_case_confirmation(request, user)
		@request = request
		mail :to => user, :subject => "Creación caso en mesa de ayuda"
	end
end

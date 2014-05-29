class User < ActiveRecord::Base

	after_create :assign_default_role

	rolify
	has_many :requests

	def assign_default_role
		add_role(:requester)
	end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
end

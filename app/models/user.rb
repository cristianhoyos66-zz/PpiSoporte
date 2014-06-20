class User < ActiveRecord::Base

	before_validation :assign_default_role

	rolify
	has_many :requests

	def assign_default_role
		add_role(:requester)
	end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
	
	attr_accessor :role
  
 def set_role(role)
    if role
      self.roles = [role]
    else
      self.roles = []
  end

  end

  def role
    self.roles.first
  end

  def has_role?(*role_names)
    self.roles.where(:name => role_names).present?
  end

end

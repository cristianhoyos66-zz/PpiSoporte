class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  scope :bases, where(resource_id: nil)

	def self.base(role_name)
    self.bases.where("name = ?", role_name).first
  end

end

class ProjectPolicy < ApplicationPolicy
	def index?
	user.present? 
	end
	def create?
		user.present? && user.user_type =='Manager' 
	end
end
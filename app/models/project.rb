class Project < ApplicationRecord
	belongs_to :user
	has_many :bugs
	has_many :user_projects
	has_many :users, through: :user_projects
	accepts_nested_attributes_for :user_projects, reject_if: proc { |pu| pu['user_id'].blank? }
	validates :title, presence: true
	validates :description, presence: true
	# after_destroy :destroy
	# def destroy
 #         	puts 'successfully create'
 #         end
end

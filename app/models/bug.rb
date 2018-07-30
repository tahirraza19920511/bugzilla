class Bug < ApplicationRecord
 belongs_to :creator, class_name: :User
 belongs_to :developer, class_name: :User, optional: true
 belongs_to :project
  mount_uploader :screenshot, ScreenshotUploader
 validates :types, presence: true
 validates :status, presence: true
 validates :title, presence: true, uniqueness: true 
	TYPE = ['feature','bug']	
		STATUS = ['new','started','completed']
end


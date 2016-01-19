class Task < ActiveRecord::Base
	has_one :user
	has_many :projects
end

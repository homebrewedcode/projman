class Project < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 2, maximum: 15 }
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
end
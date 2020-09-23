class Photo < ApplicationRecord
  
  enum label: { liked: 0, passed: 1 }
  
  belongs_to :user
  
  validates :url, presence: true
  validates :label, presence: true, inclusion: { in: labels.keys }
  
end

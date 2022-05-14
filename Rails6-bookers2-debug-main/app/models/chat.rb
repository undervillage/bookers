class Chat < ApplicationRecord
  belongs_to :speaker, class_name: "User"
  belongs_to :replyer, class_name: 'User'

  validates :message, presence: true, length: { maximum: 140 }
end

class Vote < ApplicationRecord
  belongs_to :micropost, class_name: "Micropost"
  belongs_to :voter, class_name: "User"
  validates :micropost_id, presence: true
  validates :voter_id, presence: true
end

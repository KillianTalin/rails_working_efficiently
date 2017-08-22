class Task < ApplicationRecord
  belongs_to :project
  belongs_to :tag
  belongs_to :user
end

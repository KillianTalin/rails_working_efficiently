class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, presence: :true
  validates :estimation, presence: :true


  scope :done, -> { where(done: true) }

  def minutes
    return unless elapsed_time
    (elapsed_time / 60).to_i
  end

  def minus_seconds
    return unless elapsed_time
    elapsed_time - (minutes * 60)
  end
end

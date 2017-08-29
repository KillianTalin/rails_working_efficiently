class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client

  accepts_nested_attributes_for :client

  has_many :tasks


  def price_per_project
    price_per_hour = (self.price_per_day.to_f / 8.to_f)
    hours_job = self.tasks.sum(:estimation).to_time.strftime("%H").to_i
    minutes_job = (self.tasks.sum(:estimation).to_time.strftime("%M").to_f / 60).to_f
    return price_per_project = ((hours_job.to_f + minutes_job) * price_per_hour).to_f
  end
end

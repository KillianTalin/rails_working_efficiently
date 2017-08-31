class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client

  accepts_nested_attributes_for :client

  has_many :tasks

  def price_per_project
    unless self.tasks.empty?
    price_per_hour = (self.price_per_day.to_f / 8.to_f)
    hours_job = self.tasks.sum(:estimation).to_time.strftime("%H").to_i
    minutes_job = (self.tasks.sum(:estimation).to_time.strftime("%M").to_f / 60).to_f
    return price_per_project = ((hours_job.to_f + minutes_job) * price_per_hour).to_f
    end
  end

  def days_before_deadline
   (end_date - Date.today).to_i
  end

  def price_avancement
    hours_passed = self.tasks.where(done: true).sum(:estimation).to_time.strftime("%H").to_i * 3600
    minutes_passed = self.tasks.where(done: true).sum(:estimation).to_time.strftime("%M").to_i * 60
    passed = hours_passed + minutes_passed
    if passed > 0
      prevision = self.tasks.where(done: true).sum(:elapsed_time) - passed
    elsif passed < 0
      prevision = passed - self.tasks.where(done: true).sum(:elapsed_time)
    end
    hours_job = Time.at(prevision).utc.strftime("%H").to_i
    minutes_job = (Time.at(prevision).utc.strftime("%M").to_f / 60).to_f
    avancement = (hours_job.to_f + minutes_job)
    price_per_hour = (self.price_per_day.to_f / 8.to_f)

    (price_per_hour * avancement).round(2)
  end

end

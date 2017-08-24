class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client

  accepts_nested_attributes_for :client

  has_many :tasks
end

# def new
#   @project = Project.new
# end


# def create
#   @project = Project.find(params[:project_id])
# end

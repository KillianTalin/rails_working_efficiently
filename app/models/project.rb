class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
end

def new
  @project = Project.new
end


def create
  @project = Project.find(params[:project_id])
end

class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :tags, through: :tasks
end

def new
  @project = Project.new
end


def create
  @project = Project.find(params[:project_id])
end

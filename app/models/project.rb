class Project < ActiveRecord::Base
  has_many :worker_projects
  accepts_nested_attributes_for :worker_projects

  validates :name, length: {maximum: 30}, presence: true,
  uniqueness: {scope: [:start_date, :finish_date], message: "с такой датой начала и окончания уже существует" }
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}

end

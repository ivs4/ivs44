class Worker < ActiveRecord::Base
  belongs_to :department
  has_many :worker_projects
  accepts_nested_attributes_for :department, reject_if: :all_blank
  accepts_nested_attributes_for :worker_projects

  validates :ln, length: {minimum: 2, maximum: 20}
  validates :fn, length: {minimum: 2, maximum: 20}
  validates :sn, length: {maximum: 20}
  validates :pas_number, length: {is: 6}, uniqueness: true
  validates :pas_serial, length: {is: 4}, uniqueness: true
  validates :inn, length: {is: 12}, uniqueness: true
  validates :birthday, presence: true
  validates :post, presence: true, length: {maximum: 30}

def self.search(params)
    result = Worker.eager_load(:department, :worker_projects, worker_projects: :project).references(:department)
    if params['project_id'].present?
      result = result.where("worker_projects.project_id = ?", params['project_id'])
    end
    if params['department_id'].present?
      result = result.where(department_id: params['department_id'])
    end
    if params['ln'].present?
      result = result.where(ln: params['ln'])
    end
    if params['fn'].present?
      result = result.where(fn: params['fn'])
    end
    if params['sn'].present?
      result = result.where(sn: params['sn'])
    end
    if params['birthday'].present?
      result = result.where(birthday: params['birthday'])
    end
    if params['post'].present?
      result = result.where(post: params['post'])
    end
    if params['inn'].present?
      result = result.where(inn: params['inn'])
    end
     if params['pas_number'].present?
      result = result.where(pas_number: params['pas_number'])
    end
     if params['pas_serial'].present?
      result = result.where(pas_serial: params['pas_serial'])
    end
     result.all
  end

end

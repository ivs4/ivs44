class WorkerProject < ActiveRecord::Base
  belongs_to :worker
  belongs_to :project, inverse_of: :worker_projects

end

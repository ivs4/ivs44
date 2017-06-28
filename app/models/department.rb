class Department < ActiveRecord::Base
   has_many :workers, dependent: :destroy, inverse_of: :department
   validates :name, presence: true

end

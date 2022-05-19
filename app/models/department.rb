class Department < ApplicationRecord
  has_one :manager
  has_one :manager_history, through: :manager
end

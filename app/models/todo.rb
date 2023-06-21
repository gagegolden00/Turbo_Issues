class Todo < ApplicationRecord
  has_one :user
  enum status: {in_progress: 0, complete: 1 }
end

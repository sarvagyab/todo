class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :content,  presence: true, length:{minimum: 3}
  validate :check_validity_date, :check_validity_priority

  def check_validity_priority
    if priority<1 || priority >5
      errors.add(:priority, "Priority has to be between 1 and 5 only")
    end
  end

  def check_validity_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Can't be in the past")
    end
  end
end

class TodoList < ApplicationRecord
    has_many :todo_items, dependent: :destroy

    validates :title, presence: true, length:{minimum: 3}
    validates :description, presence: true, length:{minimum: 3}
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :add_tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todos
  has_many :tasks, through: :todos

  private

  def add_tasks
    Task.all.each do |task|
      Todo.create(
        task_id: task.id,
        user_id: self.id
      )
    end 
  end 

  def update
    todo = Todo.find(params[:todo_id])
    todo.completed == !todo.completed
    todo.save
    redirect_to root_path
  end
end

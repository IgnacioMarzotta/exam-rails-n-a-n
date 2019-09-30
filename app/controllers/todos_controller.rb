class TodosController < ApplicationController
    def index
        @all_todos = Todo.where(user_id: current_user)
        @completed_todos = Todo.where(completed: true)
    end
    
    def complete
        todo = Todo.find(params[:todo_id])
        if(todo.completed == false)
            todo.completed = true
        else 
            todo.completed = false
        end
        todo.save
        redirect_to root_path
    end
end
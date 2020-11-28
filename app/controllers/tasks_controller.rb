class TasksController < ApplicationController
    #show list of tasks
    def index
        @tasks = Task.order(created_at: :desc)
    end

    def new
        @task = Task.new 
    end
    
    def create
        @task = Task.new(params.require(:task).permit(:title))
        if @task.save
            redirect_to tasks_path
        else
            redirect_to new_task_path
        end
    end

    def show
        id = params[:id]
        @task = Task.find(id)
    end

    def destroy
        id = params[:id]
        @task = Task.find(id)
        @task.destroy
        redirect_to tasks_path 
    end
   

end

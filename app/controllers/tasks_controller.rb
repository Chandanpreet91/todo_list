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
    def edit 
        id = params[:id]
        @task = Task.find(id)
    end

    def update
        id = params[:id]
        @task = Task.find(id)
        if @task.update(params.require(:task).permit(:title))
            @task.update_attribute(:is_complete, false)
            redirect_to task_path(@task)
        else
            render :edit 
        end
    end
    def complete_task
            id = params[:id]
            @task = Task.find(id)
            is_complete_val = @task.is_complete ? false :true
            if @task.update_attribute(:is_complete,is_complete_val)
            redirect_to task_path(@task)
        else
            render :show
        end

    end

    
end

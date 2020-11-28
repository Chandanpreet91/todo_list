class TasksController < ApplicationController
    #show list of tasks
    def index
        @tasks = Task.all 
    end

end

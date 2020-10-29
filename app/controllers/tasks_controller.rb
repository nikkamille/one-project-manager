class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    def show
        @task = Task.find_by(id: params[:id])
    end



    private

    def task_params
        params.require(:task).permit(:name, :description, :status, :user_id, :project_id)
    end

end

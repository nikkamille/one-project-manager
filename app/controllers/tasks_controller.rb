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


    def destroy
        @task = Task.find(params[:id]).destroy
        redirect_to tasks_path
    end



    private

    def task_params
        params.require(:task).permit(:project_title, :name, :description, :status, :user_id)
    end

end

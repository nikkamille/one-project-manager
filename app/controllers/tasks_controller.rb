class TasksController < ApplicationController

    def index
        if params[:user_id]
            @task = User.find(params[:user_id]).tasks
        else
            @tasks = Task.all
        end
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

    def edit
        @task = Task.find_by(id: params[:id])
    end

    def update
        @task = Task.find_by(id: params[:id])
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render :edit
        end
    end


    def destroy
        @task = Task.find(params[:id]).destroy
        redirect_to tasks_path
    end



    private

    def task_params
        params.require(:task).permit(:project_title, :name, :description, :user_username, :status)
    end

end

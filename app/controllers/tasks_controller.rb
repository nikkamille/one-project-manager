class TasksController < ApplicationController

    def index

        @users = User.all

        if !params[:user].blank?
            @tasks = Task.by_user(params[:user])
        else
            @tasks = Task.all
        end
    end

    def new
        # @task = Task.new(user_id: params[:user_id])
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
          else
            @task = Task.new(user_id: params[:user_id])
        end
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
        # @task = Task.find_by(id: params[:id])
        if params[:user_id]
            @task = User.find(params[:user_id]).tasks.find(params[:id])
          else
            @task = Task.find(params[:id])
        end
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
        params.require(:task).permit(:project_title, :name, :description, :user_username, :user_id, :status)
    end

end

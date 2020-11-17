class TasksController < ApplicationController

    def index

        @users = User.all
        @projects = Project.all

        if !params[:user].blank?
            @tasks = Task.by_user(params[:user])
        else
            @tasks = Task.all
        end
    end

    def new
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
        if params[:user_id]
            @task = User.find(params[:user_id]).tasks.find(params[:id])
          else
            @task = Task.find(params[:id])
        end
    end

    def edit
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            if @user.nil?
              redirect_to users_path, alert: "User not found."
            else
              @task = @user.tasks.find_by(id: params[:id])
              redirect_to user_tasks_path(@user), alert: "Task not found." if @task.nil?
            end
        else
            @post = Post.find(params[:id])
        end
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

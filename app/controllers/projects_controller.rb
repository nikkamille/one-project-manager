class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def show
        find_project_id
    end

    def edit
        find_project_id
    end

    def update
        find_project_id
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
    end

    def destroy
        find_project_id.destroy
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:title)
    end

    def find_project_id
        @project = Project.find_by(id: params[:id])
    end
    
end

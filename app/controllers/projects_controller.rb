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
        @project = Project.find_by(id: params[:id])
    end

    def edit
        @project = Project.find_by(id: params[:id])
    end

    def update
        @project = Project.find_by(id: params[:id])
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id]).destroy
        redirect_to projects_path
    end



    private

    def project_params
        params.require(:project).permit(:title)
    end

end

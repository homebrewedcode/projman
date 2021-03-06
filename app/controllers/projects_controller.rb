class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project created successfully"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show

  end

  def destroy
    @project.destroy
    flash[:danger] = "Project successfully deleted"
    redirect_to projects_path
  end

  def update
    if @project.update(project_params)
      flash[:success] = "Project successfully updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
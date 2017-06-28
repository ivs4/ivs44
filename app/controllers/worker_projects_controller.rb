class WorkerProjectsController < ApplicationController
  before_action :set_worker_project, only: [:show, :edit, :update, :destroy]

  # GET /worker_projects
  # GET /worker_projects.json
  def index
    @worker_projects = WorkerProject.all
  end

  # GET /worker_projects/1
  # GET /worker_projects/1.json
  def show
  end

  # GET /worker_projects/new
  def new
    @worker_project = WorkerProject.new
  end

  # GET /worker_projects/1/edit
  def edit
  end

  # POST /worker_projects
  # POST /worker_projects.json
  def create
    @worker_project = WorkerProject.new(worker_project_params)

    respond_to do |format|
      if @worker_project.save
        format.html { redirect_to @worker_project, notice: 'Worker project was successfully created.' }
        format.json { render :show, status: :created, location: @worker_project }
      else
        format.html { render :new }
        format.json { render json: @worker_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worker_projects/1
  # PATCH/PUT /worker_projects/1.json
  def update
    respond_to do |format|
      if @worker_project.update(worker_project_params)
        format.html { redirect_to @worker_project, notice: 'Worker project was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker_project }
      else
        format.html { render :edit }
        format.json { render json: @worker_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worker_projects/1
  # DELETE /worker_projects/1.json
  def destroy
    @worker_project.destroy
    respond_to do |format|
      format.html { redirect_to worker_projects_url, notice: 'Worker project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker_project
      @worker_project = WorkerProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_project_params
      params.require(:worker_project).permit(:worker_id, :project_id)
    end
end

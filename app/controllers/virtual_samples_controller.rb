class VirtualSamplesController < ApplicationController
  before_action :get_project, except: :index #[:show, :edit, :update, :destroy, :new, :create]
  before_action :set_virtual_sample, only: [:show, :edit, :update, :destroy]

  # GET /virtual_samples
  # GET /virtual_samples.json
  def index
    @virtual_samples = VirtualSample.all
  end

  # GET /virtual_samples/1
  # GET /virtual_samples/1.json
  def show
  end

  # GET /virtual_samples/new
  def new
    @virtual_sample = @project.build_virtual_sample
  end

  # GET /virtual_samples/1/edit
  def edit
  end

  # POST /virtual_samples
  # POST /virtual_samples.json
  def create
    @virtual_sample = @project.build_virtual_sample(virtual_sample_params)
    respond_to do |format|
      if @virtual_sample.save
        format.html { redirect_to project_virtual_sample_path, notice: 'Virtual sample was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_sample }
      else
        format.html { render :new }
        format.json { render json: @virtual_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_samples/1
  # PATCH/PUT /virtual_samples/1.json
  def update
    respond_to do |format|
      if @virtual_sample.update(virtual_sample_params)
        format.html { redirect_to project_virtual_sample_path, notice: 'Virtual sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual_sample }
      else
        format.html { render :edit }
        format.json { render json: @virtual_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_samples/1
  # DELETE /virtual_samples/1.json
  def destroy
    @virtual_sample.destroy
    respond_to do |format|
      format.html { redirect_to virtual_samples_url, notice: 'Virtual sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_sample
      @virtual_sample = @project.virtual_sample
    end

    # Only allow a list of trusted parameters through.
    def virtual_sample_params
      params.require(:virtual_sample).permit(:project_id, :video_link)
    end

    def get_project
      @project = Project.find(params[:project_id])
    end

end
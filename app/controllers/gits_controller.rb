class GitsController < ApplicationController
  before_action :set_git, only: %i[ show edit update destroy ]

  # GET /gits or /gits.json
  def index
    @gits = Git.all
  end

  # GET /gits/1 or /gits/1.json
  def show
  end

  # GET /gits/new
  def new
    @git = Git.new
  end

  # GET /gits/1/edit
  def edit
  end

  # POST /gits or /gits.json
  def create
    @git = Git.new(git_params)

    respond_to do |format|
      if @git.save
        format.html { redirect_to @git, notice: "Git was successfully created." }
        format.json { render :show, status: :created, location: @git }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @git.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /gits/1 or /gits/1.json
  def update
    respond_to do |format|
      if @git.update(git_params)
        format.html { redirect_to @git, notice: "Git was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @git }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @git.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /gits/1 or /gits/1.json
  def destroy
    @git.destroy!

    respond_to do |format|
      format.html { redirect_to gits_path, notice: "Git was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_git
      @git = Git.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def git_params
      params.expect(git: [ :status ])
    end
end

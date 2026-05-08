class CompetitorsController < ApplicationController
  before_action :set_competitor, only: %i[ show edit update destroy ]

  # GET /competitors or /competitors.json
  def index
    @competitors = Competitor.all
    
    if params[:name].present?
      @competitors = @competitors.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    end

    if params[:belt].present?
      @competitors = @competitors.where(belt: params[:belt])
    end
  end

  # GET /competitors/1 or /competitors/1.json
  def show
  end

  # GET /competitors/new
  def new
    @competitor = Competitor.new
  end

  # GET /competitors/1/edit
  def edit
  end

  # POST /competitors or /competitors.json
  def create
    @competitor = Competitor.new(competitor_params)

    respond_to do |format|
      if @competitor.save
        format.html { redirect_to @competitor, notice: "Competitor was successfully created." }
        format.json { render :show, status: :created, location: @competitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitors/1 or /competitors/1.json
  def update
    respond_to do |format|
      if @competitor.update(competitor_params)
        format.html { redirect_to @competitor, notice: "Competitor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @competitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitors/1 or /competitors/1.json
  def destroy
    @competitor.destroy!

    respond_to do |format|
      format.html { redirect_to competitors_path, notice: "Competitor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor
      @competitor = Competitor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def competitor_params
      params.expect(competitor: [ :first_name, :last_name, :age, :belt, :dojo ])
    end
end

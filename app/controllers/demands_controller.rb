class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only:[:new]
  # GET /demands
  # GET /demands.json
  def index
    @user = User.find(current_user)
    @demands = Demand.all
  end



  # GET /demands/1
  # GET /demands/1.json
  def show
    @user = User.find(current_user)
    @comment = Comment.new
    @comments = @demand.comments
    @output = @comments.map {|i| "comment is #{i.post} by "}


    require 'open-uri'
    require 'nokogiri'
    html = open("http://www.amazon.com/").read
    parsed_html = Nokogiri::HTML(html)
    images = parsed_html.css('meta')
    images.each do |image|
      @url = image.attributes["content"]
    end

    #logger.debug images.first
    #image = images.first.to_s.slice!("http://k.yimg.jp/images/clear.gif")
    #logger.debug image
    #@img = MiniMagick::Image.open('http://espnfivethirtyeight.files.wordpress.com/2014/07/transgender-banner.jpg?w=1024&h=260&crop=1')
    #logger.debug @img
    #http://stackoverflow.com/questions/15487198/display-data-scraped-from-nokogiri-in-rails
  end

  # GET /demands/new
  def new
    @demand = Demand.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Demand.new(demand_params)

    respond_to do |format|
      if @demand.save
        format.html { redirect_to demands_path, notice: 'Demand was successfully created.'}
        format.json { render action: 'show', status: :created, location: @demand }
      else
        format.html { render action: 'new' }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url }
      format.json { head :no_content }
    end
  end

  def add_one
    @medal = current_user.medal
    case params[:sort]
    when "gold"
      @medal.gold += 1
    when params[:sort] = "silver"
      @medal.silver += 1
    when params[:sort] = "bronze"
      @medal.bronze += 1
    end
    @demand = Demand.find(params[:id])
    @medal.save
    flash[:notice] = "thank you for your reviewing!"
    redirect_to @demand
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:demand).permit(:country, :gender, :age, :price, :purpose, :category, :describe, :other)
    end
end

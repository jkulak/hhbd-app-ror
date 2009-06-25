class TrackAppearancesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  # GET /track_appearances
  # GET /track_appearances.xml
  def index
    @track_appearances = TrackAppearance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @track_appearances }
    end
  end

  # GET /track_appearances/1
  # GET /track_appearances/1.xml
  def show
    @track_appearance = TrackAppearance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @track_appearance }
    end
  end

  # GET /track_appearances/new
  # GET /track_appearances/new.xml
  def new
    @track_appearance = TrackAppearance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @track_appearance }
    end
  end

  # GET /track_appearances/1/edit
  def edit
    @track_appearance = TrackAppearance.find(params[:id])
  end

  # POST /track_appearances
  # POST /track_appearances.xml
  def create
    @track_appearance = TrackAppearance.new(params[:track_appearance])

    respond_to do |format|
      if @track_appearance.save
        flash[:notice] = 'TrackAppearance was successfully created.'
        format.html { redirect_to(@track_appearance) }
        format.xml  { render :xml => @track_appearance, :status => :created, :location => @track_appearance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @track_appearance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /track_appearances/1
  # PUT /track_appearances/1.xml
  def update
    @track_appearance = TrackAppearance.find(params[:id])

    respond_to do |format|
      if @track_appearance.update_attributes(params[:track_appearance])
        flash[:notice] = 'TrackAppearance was successfully updated.'
        format.html { redirect_to(@track_appearance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @track_appearance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /track_appearances/1
  # DELETE /track_appearances/1.xml
  def destroy
    @track_appearance = TrackAppearance.find(params[:id])
    @track_appearance.destroy

    respond_to do |format|
      format.html { redirect_to(track_appearances_url) }
      format.xml  { head :ok }
    end
  end
end

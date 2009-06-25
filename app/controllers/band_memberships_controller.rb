class BandMembershipsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  # GET /band_memberships
  # GET /band_memberships.xml
  def index
    @band_memberships = BandMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @band_memberships }
    end
  end

  # GET /band_memberships/1
  # GET /band_memberships/1.xml
  def show
    @band_membership = BandMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band_membership }
    end
  end

  # GET /band_memberships/new
  # GET /band_memberships/new.xml
  def new
    @band_membership = BandMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band_membership }
    end
  end

  # GET /band_memberships/1/edit
  def edit
    @band_membership = BandMembership.find(params[:id])
  end

  # POST /band_memberships
  # POST /band_memberships.xml
  def create
    @band_membership = BandMembership.new(params[:band_membership])

    respond_to do |format|
      if @band_membership.save
        flash[:notice] = 'BandMembership was successfully created.'
        format.html { redirect_to(@band_membership) }
        format.xml  { render :xml => @band_membership, :status => :created, :location => @band_membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /band_memberships/1
  # PUT /band_memberships/1.xml
  def update
    @band_membership = BandMembership.find(params[:id])

    respond_to do |format|
      if @band_membership.update_attributes(params[:band_membership])
        flash[:notice] = 'BandMembership was successfully updated.'
        format.html { redirect_to(@band_membership) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /band_memberships/1
  # DELETE /band_memberships/1.xml
  def destroy
    @band_membership = BandMembership.find(params[:id])
    @band_membership.destroy

    respond_to do |format|
      format.html { redirect_to(band_memberships_url) }
      format.xml  { head :ok }
    end
  end
end

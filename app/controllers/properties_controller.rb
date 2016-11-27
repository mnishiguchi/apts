class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
    respond_to do |format|
      format.html {}
      format.json { render json: @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.includes(:feed, :floorplans, :property_amenities).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(
        :marketing_name,
        :website,
        :description,
        :contact_email,
        :contact_phone,
        :location_street,
        :location_city,
        :location_state,
        :location_zip,
        :location_latitude,
        :location_longitude,
        :pet_dog,
        :pet_cat,
        { floorplan_ids: [] },
        { amenity_ids:   [] },
      )
    end
end

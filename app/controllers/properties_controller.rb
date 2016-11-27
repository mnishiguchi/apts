class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.includes(:floorplans, :property_amenities).find(params[:id])
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

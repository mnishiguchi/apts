class FieldPathMappingsController < ApplicationController
  before_action :set_field_path_mapping, only: [:show, :edit, :update]

  # GET /field_path_mappings
  def index
    # http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations
    @field_path_mappings = FieldPathMapping.includes(:feed_source).all
  end

  # GET /field_path_mappings/1
  def show
  end

  # GET /field_path_mappings/1/edit
  def edit
  end

  # PATCH/PUT /field_path_mappings/1
  def update
    if @field_path_mapping.update(field_path_mapping_params)
      flash[:success] = 'Field path mapping was successfully updated.'
      redirect_to @field_path_mapping
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_path_mapping
      @field_path_mapping = FieldPathMapping.includes(:feed_source).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_path_mapping_params
      permit = [
        :location_address_1,
        :location_address_2,
        :location_city,
        :location_state,
        :location_zip,
        :location_latiitude,
        :location_longitude,
        :marketing_name,
        :contact_phone,
        :contact_email,
        :website,
        :description,
        :floorplan_name,
        :floorplan_square_feed,
        :floorplan_market_rent,
        :floorplan_effective_rent,
        :floorplan_bedroops,
        :floorplan_bathrooms,
        :floorplan_availability,
        :file_floorplan,
        :file_property,
        :amenities_community,
        :amenities_floorplan,
        :pet_dog,
        :pet_cat,
      ]
      params.require(:field_path_mapping).permit(*permit)
    end
end

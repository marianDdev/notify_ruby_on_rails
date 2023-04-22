class ManufacturersController < ApplicationController
  require 'csv'
  before_action :set_manufacturer, only: %i[ show edit update destroy ]

  def index
    @manufacturers = Manufacturer.all
  end

  def show
  end

  def new
    @manufacturers = Manufacturer.new
  end

  def edit
  end

  def import
    file = params[:file]
    #return redirect_to manufacturers_path, notice: 'Only CSV please' unless file.content_type == 'text/csv'

     opened_file = File.open(file)
    options = { headers: true, col_sep: ';' }
    CSV.foreach(opened_file, **options) do |row|
      manufacturer_hash = {}
      manufacturer_hash[:email] = row['email']
      manufacturer_hash[:name] = row['name']
      manufacturer_hash[:city] = row['city']
      manufacturer_hash[:address] = row['address']
      manufacturer_hash[:phone] = row['phone']
      manufacturer_hash[:website] = row['website']

      Manufacturer.find_or_create_by!(manufacturer_hash)
    end

    redirect_to manufacturers_path, notice: 'Manufacturers imported!'
  end

  def create
    @manufacturers = Manufacturer.new(params[:manufacturers])

    if @manufacturers.save
      redirect_to manufacturers_path
    else
      render new
    end
  end

  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to manufacturer_url(@manufacturer), notice: "Manufacturer was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /manufacturers/1 or /manufacturers/1.json
  def destroy
    @manufacturer.destroy

    respond_to do |format|
      format.html { redirect_to manufacturers_url, notice: "Manufacturer was successfully destroyed." }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manufacturer_params
      params.require(:manufacturer).permit(:email)
    end
end

class CompaniesController < ApplicationController
  require 'csv'
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @companies = Company.new
  end

  def edit
  end

  def import
    file = params[:file]
    #return redirect_to companies_path, notice: 'Only CSV please' unless file.content_type == 'text/csv'

     opened_file = File.open(file)
    options = { headers: true, col_sep: ';' }
    CSV.foreach(opened_file, **options) do |row|
      company_hash = {}
      company_hash[:email] = row['email']
      company_hash[:name] = row['name']
      company_hash[:city] = row['city']
      company_hash[:address] = row['address']
      company_hash[:phone] = row['phone']
      company_hash[:website] = row['website']

      Company.find_or_create_by!(company_hash)
    end

    redirect_to companies_path, notice: 'Companys imported!'
  end

  def create
    @companies = Company.new(params[:companies])

    if @companies.save
      redirect_to companies_path
    else
      render new
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:email)
    end
end

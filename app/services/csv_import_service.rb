class CsvImportService
require 'csv'

  def call(file)
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
  end
class CreateMailTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :mail_templates do |t|
      t.string :subject
      t.text :message
      t.string :signature

      t.timestamps
    end
  end
end

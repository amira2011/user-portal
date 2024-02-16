class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

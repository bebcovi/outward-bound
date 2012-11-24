class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :course_id
      t.date :starts_at

      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :weight
      t.integer :height
      t.string :gender
      t.string :passport_number
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :phone_number
      t.string :mobile_number
      t.string :email
      t.string :occupation
      t.text :past_experience
      t.float :boot_size
      t.string :shirt_size

      t.text :sports
      t.text :contact
      t.string :tobacco
      t.string :alcohol
      t.text :health

      t.boolean :insurance

      t.timestamps
    end
  end
end

class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :ln, null: false, limit: 20
      t.string :fn, null: false, limit: 20
      t.string :sn, limit: 20
      t.string :pas_number, null: false
      t.string :pas_serial, null: false
      t.string :inn, null: false
      t.date :birthday, null: false
      t.string :post, null: false, limit: 30
      t.references :department, index: true, foreign_key: true
      
      t.index [:pas_serial], unique: true
      t.index [:pas_number], unique: true
      t.index [:inn], unique: true


      t.timestamps null: false
    end
  end
end

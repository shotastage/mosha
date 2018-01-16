class AddImageToUsers < ActiveRecord::Migration[5.1]

  def change
    create_with :images do |t|
      t.string :name
      t.binary :data
    end
  
    add_column :name, :sata
  end
end

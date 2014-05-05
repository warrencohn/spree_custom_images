class CreateSpreeCustomImages < ActiveRecord::Migration
  def change
    create_table :spree_custom_images do |t|
      t.string :name
      t.text   :description
      t.string :format

      t.timestamps
    end
  end
end

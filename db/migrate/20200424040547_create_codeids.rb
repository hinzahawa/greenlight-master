class CreateCodeids < ActiveRecord::Migration[5.2]
  def change
    create_table :codeids do |t|
      t.integer :invite_code
      t.string :sale_name
      t.timestamps
    end
  end
end

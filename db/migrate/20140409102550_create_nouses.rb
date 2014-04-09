class CreateNouses < ActiveRecord::Migration
  def change
    create_table :nouses do |t|

      t.timestamps
    end
  end
end

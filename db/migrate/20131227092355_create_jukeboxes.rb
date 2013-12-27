class CreateJukeboxes < ActiveRecord::Migration
  def change
    create_table :jukeboxes do |t|
      t.string :title
      t.string :list

      t.timestamps
    end
  end
end

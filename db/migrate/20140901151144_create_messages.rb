class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text      :text_content
      t.integer   :from_user_id
      t.integer   :to_user_id
      t.integer   :bicycle_id
      t.timestamps
    end
  end
end

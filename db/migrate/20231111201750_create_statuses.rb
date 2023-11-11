class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
			t.references :user, null: false, foreign_key: { on_delete: :cascade }
			t.string :uuid, null: false, index: { unique: true }
			t.text :body, null: false

      t.timestamps
    end
  end
end

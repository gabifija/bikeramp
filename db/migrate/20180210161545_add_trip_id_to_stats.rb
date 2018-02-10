class AddTripIdToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :trip_id, :integer
  end
end

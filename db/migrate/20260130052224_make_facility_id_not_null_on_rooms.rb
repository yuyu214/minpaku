class MakeFacilityIdNotNullOnRooms < ActiveRecord::Migration[7.0]
  def change
    change_column_null :rooms, :facility_id, false
  end
end

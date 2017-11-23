class ChangeColumnNull < ActiveRecord::Migration[5.1]
  def change
      change_column_null :users, :phone, true
      change_column_null :users, :first_name, true
      change_column_null :users, :last_name, true
  end
end

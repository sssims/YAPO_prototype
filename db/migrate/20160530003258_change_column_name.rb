class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :password, :enc_pword
  end
end

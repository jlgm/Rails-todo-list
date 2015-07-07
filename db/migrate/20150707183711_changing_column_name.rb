class ChangingColumnName < ActiveRecord::Migration
  def change
    rename_column :lists, :type, :tipo
  end
end

class AddDivisionToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :division, null: false, foreign_key: true
  end
end

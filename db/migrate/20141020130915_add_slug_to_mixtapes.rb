class AddSlugToMixtapes < ActiveRecord::Migration
  def change
    add_column :mixtapes, :slug, :string
  end
end

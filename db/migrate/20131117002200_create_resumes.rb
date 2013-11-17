class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :title
      t.string :company
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :project
      t.integer :rating
      t.string :url

      t.timestamps
    end
  end
end

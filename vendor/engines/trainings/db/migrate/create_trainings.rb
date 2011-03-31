class CreateTrainings < ActiveRecord::Migration

  def self.up
    create_table :trainings do |t|
      t.string :focus
      t.date :first_day
      t.date :last_day
      t.string :outreach_location
      t.string :webpage
      t.string :leader
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :trainings, :id

    load(Rails.root.join('db', 'seeds', 'trainings.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "trainings"})

    Page.delete_all({:link_url => "/trainings"})

    drop_table :trainings
  end

end

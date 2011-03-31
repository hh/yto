class CreateMinistries < ActiveRecord::Migration

  def self.up
    create_table :ministries do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :webpage
      t.string :phone
      t.string :email
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :ministries, :id

    load(Rails.root.join('db', 'seeds', 'ministries.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "ministries"})

    Page.delete_all({:link_url => "/ministries"})

    drop_table :ministries
  end

end

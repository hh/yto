class CreateCommunications < ActiveRecord::Migration

  def self.up
    create_table :communications do |t|
      t.string :title
      t.text :body
      t.string :excerpt
      t.integer :position

      t.timestamps
    end

    add_index :communications, :id

    load(Rails.root.join('db', 'seeds', 'communications.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "communications"})

    Page.delete_all({:link_url => "/communications"})

    drop_table :communications
  end

end

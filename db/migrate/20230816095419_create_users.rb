class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://m.media-amazon.com/images/G/01/digital/adrive/images/personalized-devices/Make-it-Personal-LP-desktop-update_1x._TTH_.png'
      t.string :bio, default: ''
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end

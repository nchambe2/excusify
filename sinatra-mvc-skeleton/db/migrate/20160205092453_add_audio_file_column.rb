class AddAudioFileColumn < ActiveRecord::Migration
  def change
    add_column :excuses, :audio_file, :string
  end
end

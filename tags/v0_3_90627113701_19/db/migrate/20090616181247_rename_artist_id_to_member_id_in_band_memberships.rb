class RenameArtistIdToMemberIdInBandMemberships < ActiveRecord::Migration
  def self.up
    rename_column :band_memberships, :artist_id, :member_id
  end

  def self.down
    rename_column :band_memberships, :member_id, :artist_id
  end
end

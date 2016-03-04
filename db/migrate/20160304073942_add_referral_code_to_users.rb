class AddReferralCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referral_code, :integer, :null => false, :default => -1
  end
end

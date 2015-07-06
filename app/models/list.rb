class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
end


RSpec.describe Post, :type => :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      expect {
        

      }
    end
  end
end

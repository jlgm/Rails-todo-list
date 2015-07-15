require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "#create" do
    let(:list) { FactoryGirl.create(:list) }
    let(:attributes) { { task: { name: "tarefa_teste" }, list_id: list } }
    it "should be success" do
      post :create, attributes
      expect(response).to redirect_to list_path(list)
    end
  end

  describe "#destroy" do
    let(:list) { FactoryGirl.create(:list) }
    let(:task) { FactoryGirl.create(:task) }
    let(:attributes) { { id: task.id, list_id: list.id } }
    it "should be success" do
      delete :destroy, attributes
      expect(response).to redirect_to list_path(list)
    end
  end

end

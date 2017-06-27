require 'rails_helper'

describe 'Items API' do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    raw_items = JSON.parse(response.body)
    raw_item = raw_items.first
byebug
    expect(raw_items.count).to eq(3)
    expect(raw_item).to have_key("name")
    expect(raw_item).to have_key("description")
  end

  it "sends a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"
    expect(response).to be_success

    item_json = JSON.parse(response.body)
    expect(item_json["id"]).to eq(item.id)
    expect(item_json).to have_key("name")
    expect(item_json).to have_key("description")
  end

  context "POST /api/v1/items" do
    it "creates an item with valid params" do
      item_params = {
        name: "Super Mario Bros",
        description: "One of the best."
      }

      expect {
        post "/api/v1/items", params: item_params
      }.to change { Item.count }.by 1

      item = Item.last
      expect(item.name).to eq(item_params[:name])
    end
  end
end

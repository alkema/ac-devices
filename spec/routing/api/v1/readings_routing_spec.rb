require "rails_helper"

RSpec.describe Api::V1::ReadingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/readings").to route_to("api/v1/readings#index")
    end

    it "routes to #new" do
      expect(get: "/api/v1/readings/new").to route_to("api/v1/readings#new")
    end

    it "routes to #show" do
      expect(get: "/api/v1/readings/1").to route_to("api/v1/readings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/api/v1/readings/1/edit").to route_to("api/v1/readings#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/v1/readings").to route_to("api/v1/readings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/readings/1").to route_to("api/v1/readings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/readings/1").to route_to("api/v1/readings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/readings/1").to route_to("api/v1/readings#destroy", id: "1")
    end
  end
end

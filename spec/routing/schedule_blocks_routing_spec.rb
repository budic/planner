require "spec_helper"

describe ScheduleBlocksController do
  describe "routing" do

    it "routes to #index" do
      get("/schedule_blocks").should route_to("schedule_blocks#index")
    end

    it "routes to #new" do
      get("/schedule_blocks/new").should route_to("schedule_blocks#new")
    end

    it "routes to #show" do
      get("/schedule_blocks/1").should route_to("schedule_blocks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/schedule_blocks/1/edit").should route_to("schedule_blocks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/schedule_blocks").should route_to("schedule_blocks#create")
    end

    it "routes to #update" do
      put("/schedule_blocks/1").should route_to("schedule_blocks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/schedule_blocks/1").should route_to("schedule_blocks#destroy", :id => "1")
    end

  end
end

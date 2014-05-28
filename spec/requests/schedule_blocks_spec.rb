require 'spec_helper'

describe "ScheduleBlocks" do
  describe "GET /schedule_blocks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get schedule_blocks_path
      response.status.should be(200)
    end
  end
end

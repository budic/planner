require 'spec_helper'

describe "TimeBlocks" do
  describe "GET /time_blocks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get time_blocks_path
      response.status.should be(200)
    end
  end
end

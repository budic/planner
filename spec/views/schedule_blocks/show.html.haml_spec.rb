require 'spec_helper'

describe "schedule_blocks/show" do
  before(:each) do
    @schedule_block = assign(:schedule_block, stub_model(ScheduleBlock))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

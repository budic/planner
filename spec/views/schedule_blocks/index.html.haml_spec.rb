require 'spec_helper'

describe "schedule_blocks/index" do
  before(:each) do
    assign(:schedule_blocks, [
      stub_model(ScheduleBlock),
      stub_model(ScheduleBlock)
    ])
  end

  it "renders a list of schedule_blocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

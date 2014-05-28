require 'spec_helper'

describe "schedule_blocks/new" do
  before(:each) do
    assign(:schedule_block, stub_model(ScheduleBlock).as_new_record)
  end

  it "renders new schedule_block form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", schedule_blocks_path, "post" do
    end
  end
end

require 'spec_helper'

describe "schedule_blocks/edit" do
  before(:each) do
    @schedule_block = assign(:schedule_block, stub_model(ScheduleBlock))
  end

  it "renders the edit schedule_block form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", schedule_block_path(@schedule_block), "post" do
    end
  end
end

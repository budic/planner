require 'spec_helper'

describe "todos/index" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :schedule_id => 1,
        :task_id => 2,
        :position => 3
      ),
      stub_model(Todo,
        :schedule_id => 1,
        :task_id => 2,
        :position => 3
      )
    ])
  end

  it "renders a list of todos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

require 'spec_helper'

describe "todos/edit" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :schedule_id => 1,
      :task_id => 1,
      :position => 1
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do
      assert_select "input#todo_schedule_id[name=?]", "todo[schedule_id]"
      assert_select "input#todo_task_id[name=?]", "todo[task_id]"
      assert_select "input#todo_position[name=?]", "todo[position]"
    end
  end
end

require 'spec_helper'

describe "todos/new" do
  before(:each) do
    assign(:todo, stub_model(Todo,
      :schedule_id => 1,
      :task_id => 1,
      :position => 1
    ).as_new_record)
  end

  it "renders new todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todos_path, "post" do
      assert_select "input#todo_schedule_id[name=?]", "todo[schedule_id]"
      assert_select "input#todo_task_id[name=?]", "todo[task_id]"
      assert_select "input#todo_position[name=?]", "todo[position]"
    end
  end
end

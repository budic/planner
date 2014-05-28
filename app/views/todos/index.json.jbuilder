json.array!(@todos) do |todo|
  json.extract! todo, :id, :schedule_id, :task_id, :position
  json.url todo_url(todo, format: :json)
end

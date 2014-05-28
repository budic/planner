json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :today, :user_id
  json.url schedule_url(schedule, format: :json)
end

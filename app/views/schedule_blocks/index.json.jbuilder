json.array!(@schedule_blocks) do |schedule_block|
  json.extract! schedule_block, :id
  json.url schedule_block_url(schedule_block, format: :json)
end

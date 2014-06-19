json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :contacts, :state, :salary
  json.url employee_url(employee, format: :json)
end

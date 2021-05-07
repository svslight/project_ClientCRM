ThinkingSphinx::Index.define :user, with: :active_record do
  # fields
  indexes email, sortable: true 
  indexes first_name
  indexes last_name
  indexes client.city, as: :client_city, sortable: true
  indexes client.address, as: :client_address, sortable: true

  # attributes
  has client_id, created_at, updated_at
end

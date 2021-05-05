ThinkingSphinx::Index.define :user, with: :active_record do
  # fields
  indexes email, sortable: true 
  indexes first_name
  indexes last_name

  # attributes
  has client_id, created_at, updated_at
end

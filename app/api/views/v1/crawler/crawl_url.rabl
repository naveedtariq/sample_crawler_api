child @requested_url , object_root: false do
  attributes :url
  child :tags , object_root: false do
    attributes :name, :text, :url
  end
end
node(:status) { "1" }
node(:message) { "Successfull" }
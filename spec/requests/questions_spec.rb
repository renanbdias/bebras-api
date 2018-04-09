# Rspec.describe "Question" do



# end

# Rspec.describe "Question" do

# end

# # RSpec.describe "Forum" do
# #   # ActiveJob::Base.queue_adapter = :inline

# #   let(:naka) { create :user, :naka }
# #   let(:allan) { create :user, :allan }
# #   let(:junio) { create :user, :junio }
# #   let(:mano) { create :user, :mano }
# #   let(:renan) { create :user, :renan }

# #   context "Naka create a Topic" do
# #     before :each do
# #       topic_response = CreateTopicService.call(by_user: naka, title: "Um Título qualquer", text: "Um Teste qualquer", image: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'photo_image.jpg'), 'image/jpeg'))

# #       expect(topic_response.success?).to be true
# #       @naka_topic = topic_response.result
# #     end

# #     it ": it should have naka as owner" do
# #       expect(@naka_topic.user.id).to be naka.id
# #     end
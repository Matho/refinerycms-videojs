require 'spec_helper'
describe Refinery::Videos::Admin::VideoFilesController do
  let(:logged_in_user) { Refinery::Core::NilUser.new }

  describe 'delete video file' do
    before do
      @video = FactoryGirl.build(:video, :use_shared => false)
      @video_file = FactoryGirl.create(:video_file, :external_url => 'url', :use_external => true)
      @video.video_files << @video_file
      @video.save!
    end

    it 'should delete video_file' do
      post :destroy, :id => @video_file.id
      expect(response.status).to redirect_to(refinery.edit_videos_admin_video_path(@video))
      expect(::Refinery::Videos::VideoFile.count).to eq(0)
    end

  end

end

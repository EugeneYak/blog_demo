require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe "#post" do
    subject { post :create, params: post_params }

    context "with valid params" do
      let(:post_params) do
        {
            author_login: "test",
            author_ip: "0.0.0.0",
            content: "Hello, world!",
            title: "Greetings"
        }
      end

      it "success" do
        expect(subject).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:post_params) do
        {
            author_login: "test",
            author_ip: "0.0.0.0",
            content: "Hello, world!"
        }
      end

      it "failed" do
        expect(subject).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

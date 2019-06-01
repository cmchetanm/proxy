require 'rails_helper'

RSpec.describe ForwardsController, type: :controller do
  describe "#Forword" do

    context "POST #create" do

      it "when the request is valid with proxy true" do
        expect{
          post :create, params: { proxy: true, type: "static", app_id: 1}
        }.to change{Ping.count}.by(1)
      end

      it "when the request is valid with proxy false" do
        expect{
          post :create, params: { proxy: false, type: "static", app_id: 1}
        }.to_not change(Ping, :count)
      end

      it "when the request is invalid parameter" do
        query_params = { proxy: true}
        post :create, params: query_params
        expect(response).to redirect_to(ENV['FORWARD_TO_URL']  + "?#{query_params.to_query}")
        expect(response).to have_http_status(302)
        expect(Ping.last.ping_errors).not_to be_empty
      end

      it "when the request is valid parameter" do
        query_params = { proxy: true, type: "static", app_id: 1}
        post :create, params: query_params
        expect(response).to redirect_to(ENV['FORWARD_TO_URL']  + "?#{query_params.to_query}")
        expect(response).to have_http_status(302)
      end
    end
  end
end

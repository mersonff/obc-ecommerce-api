require 'rails_helper'

RSpec.describe "Admin V1 Users as :admin", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }

    context "GET /users" do
      let(:url) { "/admin/v1/users" }
      let!(:admins) { create_list(:user, 5) }

      it "returns all Users" do
        admins << user
        get url, headers: auth_header(user)
        expect(body_json['users']).to contain_exactly *admins.as_json(only: %i(id name email profile))
      end

      it "returns success status" do
        get url, headers: auth_header(user)
        expect(response).to have_http_status(:ok)
      end
    end

    context "POST /users" do
      let(:url) { "/admin/v1/users" }

      context "with valid params" do
        let(:admin_params) { { user: attributes_for(:user) }.to_json }

        it 'adds a new User' do
          expect do
            post url, headers: auth_header(user), params: admin_params
            #by two because of the fist user? Line 5.
          end.to change(User, :count).by(2)
        end

        it 'returns last added User' do
          post url, headers: auth_header(user), params: admin_params
          expected_admin = User.last.as_json(only: %i(id name email profile))
          expect(body_json['user']).to eq expected_admin
        end

        it 'returns success status' do
          post url, headers: auth_header(user), params: admin_params
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        let(:admin_invalid_params) do
          { user: attributes_for(:user, name: nil) }.to_json
        end

        it 'does not add a new User' do
          expect do
            post url, headers: auth_header(user), params: admin_invalid_params
            #by 1 because of line 5?
          end.to change(User, :count).by(1)
        end

        it 'returns error message' do
          post url, headers: auth_header(user), params: admin_invalid_params
          expect(body_json['errors']['fields']).to have_key('name')
        end

        it 'returns unprocessable_entity status' do
          post url, headers: auth_header(user), params: admin_invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "PATCH /users/:id" do
      let(:admin) { create(:user) }
      let(:url) { "/admin/v1/users/#{admin.id}" }

      context "with valid params" do
        let(:new_name) { 'My new User' }
        let(:admin_params) { { user: { name: new_name } }.to_json }

        it 'updates User' do
          patch url, headers: auth_header(user), params: admin_params
          admin.reload
          expect(admin.name).to eq new_name
        end

        it 'returns updated User' do
          patch url, headers: auth_header(user), params: admin_params
          admin.reload
          expected_admin = admin.as_json(only: %i(id name email profile))
          expect(body_json['user']).to eq expected_admin
        end

        it 'returns success status' do
          patch url, headers: auth_header(user), params: admin_params
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        let(:admin_invalid_params) do
          { user: attributes_for(:user, name: nil) }.to_json
        end

        it 'does not update User' do
          old_name = user.name
          patch url, headers: auth_header(user), params: admin_invalid_params
          user.reload
          expect(user.name).to eq old_name
        end

        it 'returns error message' do
          patch url, headers: auth_header(user), params: admin_invalid_params
          expect(body_json['errors']['fields']).to have_key('name')
        end

        it 'returns unprocessable_entity status' do
          patch url, headers: auth_header(user), params: admin_invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "DELETE /users/:id" do
      let!(:admin) { create(:user) }
      let(:url) { "/admin/v1/users/#{admin.id}" }

      it 'removes User' do
        expect do
          delete url, headers: auth_header(user)
          #because line 5?
        end.to_not change(User, :count)
      end

      it 'returns success status' do
        delete url, headers: auth_header(user)
        expect(response).to have_http_status(:no_content)
      end

      it 'does not return any body content' do
        delete url, headers: auth_header(user)
        expect(body_json).to_not be_present
      end
    end

  end
end

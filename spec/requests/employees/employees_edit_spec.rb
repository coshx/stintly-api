require 'rails_helper'

RSpec.describe "Employees edit", type: :request do
  let(:route) { { type: :get, url: edit_employee_path(organization_id: organization, id: employee.id) } }

  let(:policy) { EmployeePolicy }
  let(:authorization) { :update? }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:employee) { create(:employee, organization: organization) }
  
  it_behaves_like :authentication_required_route
  it_behaves_like :authorization_required_route

  it "returns a success response" do
    stub_authorization()
    get_request({})

    expect(response).to be_success
  end
end
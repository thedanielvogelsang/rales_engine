require 'rails_helper'

describe 'Customer search API' do
  it "returns a single customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)
  end

  it "returns a single customer by first name" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(first_name)
  end

  it "returns a single customer by last name " do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(last_name)
  end

  it "returns a single customer by created at" do
    created = create(:customer, created_at: "January 1 1900")

    get "/api/v1/customers/find?created_at=January_1_1900"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(created.id)
  end

  it "returns a single customer by updated at" do
    updated = create(:customer, updated_at: "January 1 2000")

    get "/api/v1/customers/find?updated_at=January_1_2000"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(updated.id)
  end

  # find all tests below

  it "returns a single customer when searching find all by ID" do
    id = create(:customer).id

    get "/api/v1/customers/find_all?id=#{id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(id)
  end

  it "returns multiple customers by first name" do
    customer_1, customer_2 = create_list(:customer, 2, first_name: "steve")

    get "/api/v1/customers/find_all?first_name=steve"

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(2)
  end

  it "returns multiple customers by last name" do
    customer_1, customer_2 = create_list(:customer, 2, last_name: "rogers")

    get "/api/v1/customers/find_all?last_name=rogers"

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(2)
  end

  it "returns multiple customers by created at" do
    customer_1, customer_2 = create_list(:customer, 2, created_at: "July 4 1946")

    get "/api/v1/customers/find_all?created_at=July_4_1946"

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(2)
  end

  it "returns multiple customers by updated at" do
    customer_1, customer_2 = create_list(:customer, 2, updated_at: "July 4 2007")

    get "/api/v1/customers/find_all?updated_at=July_4_2007"

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(2)
  end
end

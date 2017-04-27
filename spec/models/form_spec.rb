require "rails_helper"

RSpec.describe Form, type: :model do

  it "should return validation error after trying to create form "\
   "with age less than 17" do
    form = Form.new(name: 'Denis Popov', age: 16)
    form.valid?
    expect(form.errors[:age]).not_to be_empty
  end

  it "should return validation error after trying to create form "\
   "with age more than 65" do
    form = Form.new(name: 'Denis Popov', age: 66)
    form.valid?
    expect(form.errors[:age]).not_to be_empty
  end

  it "should return validation error after trying to create form "\
   "with name contained 2 words with small letter" do
    form = Form.new(name: 'denis popov', age: 21)
    form.valid?
    expect(form.errors[:name]).not_to be_empty
  end

  it "should return validation error after trying to create form "\
   "with name contained 2 words with small letter" do
    form = Form.new(name: 'Denis', age: 21)
    form.valid?
    expect(form.errors[:name]).not_to be_empty
  end

  it "should return validation error after trying to create form "\
   "with one words in name" do
    form = Form.new(name: 'Denis', age: 21)
    form.valid?
    expect(form.errors[:name]).not_to be_empty
  end

  it "should return validation error if form with "\
    "related_form_id has not saved" do
    form = Form.new(name: 'Denis Popov', age: 21, related_form_id: 1)
    form.valid?
    expect(form.errors[:related_form_id]).not_to be_empty
  end

  it "should not return validation error if form with "\
    "related_form_id has alredy saved" do
    Form.create!(name: 'Denis Popov', age: 21)
    form = Form.new(name: 'Ivan Petrov', age: 30, related_form_id: 1)
    form.valid?
    expect(form.errors[:related_form_id]).to be_empty
    expect(form.save).to be_truthy
  end
end
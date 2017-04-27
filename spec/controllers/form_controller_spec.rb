require "rails_helper"

RSpec.describe FormsController, type: :controller do

  describe "GET #show" do

    it "responds successfully with an HTTP 200 status code" do
      form = Form.create!(name: 'Denis Popov', age: 20)
      get :show, id: form.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      form = Form.create!(name: 'Denis Popov', age: 20)
      get :show, id: form.id
      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do

    it "redirect to show page if there is no validation error" do
      post :create, form: { name: 'Denis Popov', age: 20 }
      expect(response).to redirect_to form_path(assigns(:form))
    end

    it "reders new page if there is validation error" do
      post :create, form: { name: 'Denis Popov', age: nil }
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do

    it "redirect to show page if there is no validation error" do
      post :create, form: { name: 'Denis Popov', age: 20 }
      expect(response).to redirect_to form_path(assigns(:form))
    end

    it "reders new page if there is validation error" do
      post :create, form: { name: 'Denis Popov', age: nil }
      expect(response).to render_template("new")
    end
  end

  describe "GET #new" do
    it 'assigns a new form to @form' do
      get :new
      expect(assigns(:form)).to be_a_new(Form)
    end
  end
end

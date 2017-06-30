require 'rails_helper'

RSpec.describe TalentsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "renders the correct template" do
      expect(@response).to render_template :index
    end

    it { should respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do
      @talent = create :talent_with_sources
      get :show, params: { id: @talent.id }
    end

    it "assigns the requested talent to @talent" do
      expect(assigns(:talent)).to eq(@talent)
    end

    it "renders the correct template" do
      expect(@response).to render_template :show
    end

    it { should respond_with 200 }
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "should build a new Talent" do
      expect(assigns(:talent)).to be_a_new Talent
    end

    it "renders the correct template" do
      expect(@response).to render_template :new
    end

    it { should respond_with 200 }
  end

  describe "GET #edit" do
    before(:each) do
      @talent = create :talent_with_sources
      get :edit, params: { id: @talent.id } 
    end

    it "assigns the requested talent to @talent" do
      expect(assigns(:talent)).to eq(@talent)
    end

    it "renders the correct template" do
      expect(@response).to render_template :edit
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "with valid attributes" do

      before(:each) do
        @talent_attrs = attributes_for(:talent_with_sources)
        @talent_attrs[:sources_attributes] = { "1": { page: 95, book: "The new book", _destroy: false } }
      end
      it "creates a new talent" do
        expect{
          post :create, params: { talent: @talent_attrs }
        }.to change(Talent, :count).by(1)
      end
      
      it "redirects to the new talent" do
        post :create, params: { talent: @talent_attrs }
        expect(response).to redirect_to talents_url
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new talent" do
        expect{
          post :create, params: { talent: attributes_for(:talent, name: nil) }
        }.to_not change(Talent, :count)
      end
      
      it "re-renders the new method" do
        post :create, params: { talent: attributes_for(:talent, name: nil) }
        expect(response).to render_template :new
      end
    end 
  end

  describe 'PATCH #update' do
    before(:each) do
      @talent = create(:talent, name: "Parry", ranked: true)
    end
    
    context "valid attributes" do
      it "located the requested @talent" do
        patch :update, params: { id: @talent, talent: attributes_for(:talent, name: "Second Wind", ranked: false) }
        expect(assigns(:talent)).to eq(@talent)      
      end
    
      it "changes @talent's attributes" do
        patch :update, params: { id: @talent, talent: attributes_for(:talent, name: "Second Wind", ranked: false) }
        @talent.reload
        expect(@talent.name).to eq("Second Wind")
        expect(@talent.ranked).to eq(false)
      end
    
      it "redirects to the updated talent" do
        patch :update, params: { id: @talent, talent: attributes_for(:talent, name: "Second Wind", ranked: false) }
        expect(response).to redirect_to talents_url
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @talent" do
        patch :update, params: { id: @talent, talent: attributes_for(:talent, name: nil) }
        expect(assigns(:talent)).to eq(@talent)      
      end
      
      it "does not change @talent's attributes" do
        patch :update, params: { id: @talent, talent: attributes_for(:talent, name: "Second Wind", ranked: nil) }
        @talent.reload
        expect(@talent.name).not_to eq("Second Wind")
        expect(@talent.ranked).to eq(true)
      end
      
      it "re-renders the edit method" do
        patch :update, params: { id: @talent, talent: attributes_for(:talent, name: "Second Wind", ranked: nil) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @talent = create :talent
    end
    
    it "deletes the talent" do
      expect{
        delete :destroy, params: { id: @talent }        
      }.to change(Talent, :count).by(-1)
    end
      
    it "redirects to talents#index" do
      delete :destroy, params: { id: @talent }
      expect(response).to redirect_to talents_url
    end
  end
end
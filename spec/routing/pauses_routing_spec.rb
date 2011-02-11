require 'spec_helper'

describe PausesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/pauses" }.should route_to(:controller => "pauses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pauses/new" }.should route_to(:controller => "pauses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pauses/1" }.should route_to(:controller => "pauses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pauses/1/edit" }.should route_to(:controller => "pauses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pauses" }.should route_to(:controller => "pauses", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/pauses/1" }.should route_to(:controller => "pauses", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pauses/1" }.should route_to(:controller => "pauses", :action => "destroy", :id => "1") 
    end
  end
end

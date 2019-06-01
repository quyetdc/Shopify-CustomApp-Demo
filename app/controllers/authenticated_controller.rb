# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include HTTParty

  include ShopifyApp::Authenticated
end

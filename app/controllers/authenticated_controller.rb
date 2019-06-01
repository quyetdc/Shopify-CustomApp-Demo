# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  require 'HTTParty'

  include ShopifyApp::Authenticated
end

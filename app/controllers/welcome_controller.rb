class WelcomeController < ApplicationController
    def home

        if logged_in?
            redirect_to posts_path
        else
            "/"
        end

    end
    
end

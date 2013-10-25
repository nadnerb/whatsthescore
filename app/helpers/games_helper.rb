# Helper methods defined here can be accessed in any controller or view in the application

Whatsthescore::App.helpers do
  # def simple_helper_method
  #  ...
  # end
  def score team
    '''{ 
        \"score\":\"1/10\",
        \"status\":\"continue\",
        \"encouragement\":\"Less hand waving, more hitting\".
        \"scoring_team\":\"team_a\"
    }'''
  end
end

class Home::Index < BrowserAction
  include Auth::AllowGuests

  get "/" do
    if current_user?
      redirect Posts::Index
    else
      redirect SignIns::New
    end
  end
end

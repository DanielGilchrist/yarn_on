BaseEmail.configure do |settings|
  settings.adapter = Carbon::DevAdapter.new(print_emails: LuckyEnv.development?)
end

Lucky::ProtectFromForgery.configure do |settings|
  settings.allow_forgery_protection = !LuckyEnv.test?
end

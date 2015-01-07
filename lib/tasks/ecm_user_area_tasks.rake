namespace :ecm_user_area do
  desc "Creates missing roles from engines"
  task :collect_roles => :environment do |t, args|
    Ecm::UserArea::RoleCollector.call
  end
end

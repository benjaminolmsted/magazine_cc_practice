class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.pluck(:email).join("; ")
    end

    def self.most_popular
        all_mags = self.all
        pop_mag = nil
        pop_count = 0
        all_mags.each do |mag|
            if mag.subscriptions.count > pop_count
                pop_count = mag.subscriptions.count
                pop_mag = mag
            end
        end
        
        pop_mag
        #go through them
        #checkout mag.sub.count
        #compare
    end

end
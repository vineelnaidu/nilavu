module Sources
  module Runningbooks
    class Usermodel < Sources::Runningbooks::Base
      def get(options = {})
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
        puts options[:wid].to_i
        #widget  = Widget.find(options[:widgetid].to_i) 
        widget  = Widget.find(options[:wid].to_i)
        dashboard_id = widget.dashboard_id
        dashboard = Dashboard.find(dashboard_id)
        user_id = dashboard.user_id
        r = (CloudBooksHistory.where(:book_id => CloudBook.where(:users_id => user_id)).where(:status => 'running').count).to_f
        t = (CloudBook.where(:users_id => user_id).count).to_f        
        if t == 0.0
        a = 0.0
        else
        a = ((r/t)*100.0).to_f.round(2)
        end
        puts a

        { :value => r, :average => a }
      end

    end

  end
end

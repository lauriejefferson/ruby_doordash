module RubyDoordash
  class ReportingResource < Resource
    def request_report(**business)
      post_request("dataexchange/v1/reports", body: business).body
    end

    def get_report_link(report_id:)
      get_request("dataexchange/v1/reports/#{report_id}/reportlink").body
    end
  end
end
